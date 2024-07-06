package DAO;

import dal.ConnectDB;
import dto.ExecutionDatabaseResult;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.ArrayUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public abstract class ConnectDbDao<T> implements DAO<T> {

    private final ConnectDB connectDB = ConnectDB.getInstance();
    protected final Logger logger = Logger.getLogger(this.getClass().getName());

    @Override
    public List<T> getByIds(Collection<? extends Number> ids) {
        return null;
    }

    protected <TYPE> Optional<TYPE> queryOne(
        String sql,
        Mapper<ResultSet, TYPE> mapper,
        Object... params
    ) {
        final List<TYPE> query = this.query(
            sql,
            mapper,
            params
        );
        if (CollectionUtils.isNotEmpty(query)) {
            return Optional.ofNullable(query.get(0));
        }
        return Optional.empty();
    }

    protected <TYPE> List<TYPE> query(
        String sql,
        Mapper<ResultSet, TYPE> mapper,
        Object... params
    ) {
        return this.query(
            sql,
            true,
            mapper,
            params
        );
    }

    protected <TYPE> List<TYPE> query(
        String sql,
        boolean cleanup,
        Mapper<ResultSet, TYPE> mapper,
        Object... params
    ) {
        logger.info("SQL: " + sql);
        return this.process(
            executionDbInput -> {
                PreparedStatement preparedStatement = executionDbInput.getConnection().prepareStatement(sql);
                this.setParams(
                    preparedStatement,
                    params
                );
                ResultSet resultSet = preparedStatement.executeQuery();
                executionDbInput.setCloseAbles(
                    preparedStatement,
                    resultSet
                );
                List<TYPE> list = new ArrayList<>();
                while (resultSet.next()) {
                    final TYPE res = mapper.map(resultSet);
                    list.add(res);
                }
                return list;
            },
            cleanup,
            new ArrayList<>()
        );
    }

    protected ExecutionDatabaseResult execute(
        String sql,
        Object... params
    ) {
        return this.execute(
            sql,
            true,
            params
        );
    }

    protected ExecutionDatabaseResult execute(
        String sql,
        boolean cleanup,
        Object... params
    ) {
        logger.info("SQL: " + sql);
        return this.process(
            executionDbInput -> {
                Long key = null;
                PreparedStatement preparedStatement = executionDbInput.getConnection().prepareStatement(
                    sql,
                    Statement.RETURN_GENERATED_KEYS
                );
                executionDbInput.setCloseAbles(preparedStatement);
                this.setParams(
                    preparedStatement,
                    params
                );
                Integer row = preparedStatement.executeUpdate();
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        key = generatedKeys.getLong(1);
                    }
                }
                return new ExecutionDatabaseResult(
                    row,
                    key
                );
            },
            cleanup,
            new ExecutionDatabaseResult(
                null,
                null
            )
        );
    }

    protected <TYPE> int[] executeBatch(
        String sql,
        List<TYPE> data,
        Mapper<TYPE, Object[]> mapper
    ) {
        return this.process(
            executionDbInput -> {
                PreparedStatement preparedStatement = executionDbInput.getConnection().prepareStatement(sql);
                executionDbInput.setCloseAbles(preparedStatement);
                for (TYPE x : data) {
                    final Object[] params = mapper.map(x);
                    this.setParams(
                        preparedStatement,
                        params
                    );
                    preparedStatement.addBatch();
                }
                return preparedStatement.executeBatch();
            },
            true,
            new int[]{}
        );

    }

    protected void setParams(
        PreparedStatement preparedStatement,
        Object... params
    ) throws SQLException {
        if (ArrayUtils.isNotEmpty(params)) {
            for (int i = 0; i < params.length; i++) {
                preparedStatement.setObject(
                    i + 1,
                    params[i]
                );
            }
        }
    }

    private <TYPE> TYPE process(
        Mapper<ExecutionDbInput, TYPE> mapper,
        boolean cleanup,
        TYPE defaultValue
    ) {
        ExecutionDbInput executionDbInput = new ExecutionDbInput();
        try {
            Connection connection = this.connectDB.openConnection();
            executionDbInput.setConnection(connection);
            return mapper.map(executionDbInput);
        } catch (Exception ex) {
            logger.log(
                Level.SEVERE,
                ex.getMessage(),
                ex
            );
        } finally {
            if (cleanup) {
                this.connectDB.closeResources(
                    executionDbInput.getConnection(),
                    executionDbInput.closeAbles
                );
            }
        }
        return defaultValue;
    }

    @FunctionalInterface
    public interface Mapper<I, O> {
        O map(I i) throws Exception;
    }

    public static class ExecutionDbInput {
        Connection connection;
        AutoCloseable[] closeAbles;

        public Connection getConnection() {
            return connection;
        }

        public void setConnection(Connection connection) {
            this.connection = connection;
        }

        public void setCloseAbles(AutoCloseable... closeAbles) {
            this.closeAbles = closeAbles;
        }
    }
}
