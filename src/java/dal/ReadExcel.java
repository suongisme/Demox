/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.openxml4j.opc.PackagePart;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

/**
 * @author Desktop
 */
public class ReadExcel {

    public static void main(String[] args) throws InvalidFormatException, IOException {
        ReadExcel reader = new ReadExcel();
        //
        String excelFilePath = "C:\\Users\\Desktop\\Downloads\\Test.xlsx";
        String imageFilePath = "C:\\Users\\Desktop\\Documents\\NetBeansProjects\\SWPClubManegement\\web\\IMAGE\\PLAYER";

        FileInputStream excelFileInputStream = new FileInputStream(excelFilePath);
        Workbook workbook = new XSSFWorkbook(excelFileInputStream);
        Sheet sheet = workbook.getSheetAt(0); // Lấy sheet đầu tiên

        // Lấy ra danh sách tất cả các hình ảnh trong sheet
        List<? extends PictureData> pictures = workbook.getAllPictures();
        String[] players = {
            "De Bruyne",
            "Messi",
            "Neymar",
            "Mbappe",
            "Salah",
            "Ronaldo ",
            "Lewandowski",
            "Kane",
            "De Gea",
            "Kante"
        };
        int i = 1;
        for (PictureData pictureData : pictures) {
            Row row = sheet.getRow(i);
            Cell cell = row.getCell(2);
            cell.getStringCellValue();
            // Kiểm tra định dạng hình ảnh (JPEG, PNG, ...)
            String ext = pictureData.suggestFileExtension();
            byte[] pictureBytes = pictureData.getData();

            // Tạo tên tệp dựa trên thời gian để tránh trùng lặp
            String fileName = cell.getStringCellValue().replace(
                " ",
                "_"
            ) + System.currentTimeMillis() + "." + ext;

            // Đường dẫn đầy đủ đến tệp đầu ra
            String outputFilePath = imageFilePath + File.separator + fileName;

            // Ghi dữ liệu hình ảnh ra tệp
            FileOutputStream fileOutputStream = new FileOutputStream(outputFilePath);
            fileOutputStream.write(pictureBytes);
            fileOutputStream.close();

            System.out.println("Đã lưu hình ảnh vào: " + outputFilePath);
            i++;
        }

        workbook.close();
        excelFileInputStream.close();


    }

    public static void extractImagesFromSheet(
        XSSFSheet sheet,
        int sheetIndex,
        String outputFolder
    ) throws InvalidFormatException {
        try {
            // Get all parts from the sheet's package
            XSSFDrawing drawing = sheet.getDrawingPatriarch();

            if (drawing == null) {
                System.out.println("No drawing found in the sheet.");
                return;
            }

            // Iterate over all shapes in the drawing
            for (XSSFShape shape : drawing.getShapes()) {
                if (shape instanceof XSSFPicture picture) {
                    ClientAnchor anchor = picture.getPreferredSize();

                    // Get the cell row and column where the picture is anchored
                    int pictureRow = anchor.getRow1();
                    int pictureCol = anchor.getCol1();
                    PictureData pictureData = picture.getPictureData();
                    String contentType = pictureData.getMimeType();

                    if (contentType.startsWith("image/")) {
                        processImagePart(
                            pictureData,
                            sheetIndex,
                            pictureRow,
                            pictureCol,
                            outputFolder
                        );
                    } else {
                        System.out.println("Non-image content type: " + contentType);
                    }
                } else {
                    System.out.println("Non-picture shape found: " + shape);
                }
            }


        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private static void processImagePart(
        PictureData pictureData,
        int sheetIndex,
        int targetRow,
        int targetColumn,
        String outputFolder
    ) throws IOException {
        System.out.println("Found image at row: " + targetRow + ", column: " + targetColumn);

        // Extract image data
        byte[] imageData = pictureData.getData();

        // Determine the image file name based on sheet index, row, and column
        String fileExtension = pictureData.suggestFileExtension();
        String fileName = "image_" + sheetIndex + "_row_" + targetRow + "_col_" + targetColumn + "." + fileExtension;
        File imageFile = new File(outputFolder + File.separator + fileName);

        // Save the image file
        saveImageFile(
            imageFile,
            imageData,
            sheetIndex,
            targetRow,
            targetColumn
        );
    }

    private static void saveImageFile(
        File imageFile,
        byte[] imageData,
        int sheetIndex,
        int targetRow,
        int targetColumn
    ) {
        try (FileOutputStream fos = new FileOutputStream(imageFile)) {
            fos.write(imageData);
            System.out.println("Saved image from Sheet " + sheetIndex + ", Row " + targetRow + ", Column " + targetColumn + ": " + imageFile.getAbsolutePath());
        } catch (IOException e) {
            System.err.println("Failed to save image: " + imageFile.getAbsolutePath());
            e.printStackTrace();
        }
    }

    public void readAndSaveImagesFromExcel(
        String excelFilePath,
        String outputFolder
    ) throws InvalidFormatException {
        try (
            FileInputStream fis = new FileInputStream(excelFilePath);
            OPCPackage pkg = OPCPackage.open(fis);
            XSSFWorkbook wb = new XSSFWorkbook(pkg)
        ) {

            System.out.println("Opening the Excel file: " + excelFilePath);

            for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {
                XSSFSheet sheet = wb.getSheetAt(sheetIndex);
                System.out.println("Processing sheet: " + sheet.getSheetName());
                sheet.getRow(sheetIndex);
                // Get all package parts related to images
                for (PackagePart part : pkg.getParts()) {
                    if (part.getContentType().startsWith("image/")) {
                        System.out.println("Found image part: " + part.getPartName());

                        // Extract image data
                        byte[] imageData = part.getInputStream().readAllBytes();

                        // Save image to output folder
                        String fileExtension = part.getContentType().split("/")[1];
                        String fileName = "image_" + sheetIndex + "_row_" + part.getPartName().getName()
                            .hashCode() + "." + fileExtension;
                        File imageFile = new File(outputFolder + File.separator + fileName);

                        try (FileOutputStream fos = new FileOutputStream(imageFile)) {
                            fos.write(imageData);
                            System.out.println("Saved image from Sheet " + sheetIndex + ", Row " + part.getPartName()
                                .getName() + ": " + imageFile.getAbsolutePath());
                        } catch (IOException e) {
                            System.err.println("Failed to save image: " + imageFile.getAbsolutePath());
                            e.printStackTrace();
                        }
                    }
                }
            }

            System.out.println("Excel file processing completed.");

        } catch (IOException | InvalidFormatException e) {
            System.err.println("Error processing Excel file: " + e.getMessage());
            e.printStackTrace();
        }
    }

}
