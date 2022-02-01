*** Settings ***
Library  OperatingSystem

*** Keywords ***
Clean Evidence
  IF  ${CLEAN_EVIDENCE} == ${True}
    ${list_files}  List Files In Directory  ${OUTPUT_DIR}
    Run Keyword And Ignore Error  Remove File  ${OUTPUT_DIR}\\evidence.zip
    FOR  ${index}  ${file}  IN ENUMERATE  @{list_files}
      IF  "${file}"!="output.xml"
        Remove File  ${OUTPUT_DIR}\\${file}
      END
    END
    ${list_directories}  List Directories In Directory  ${OUTPUT_DIR}
    FOR  ${index}  ${directory}  IN ENUMERATE  @{list_directories}
        Remove Directory  ${OUTPUT_DIR}\\${directory}  true
    END
  END
