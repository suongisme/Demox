package dto;

public class ExecutionDatabaseResult {
    private Integer rows;
    private Long key;

    public ExecutionDatabaseResult(
        Integer rows,
        Long key
    ) {
        this.rows = rows;
        this.key = key;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public Long getKey() {
        return key;
    }

    public void setKey(Long key) {
        this.key = key;
    }
}
