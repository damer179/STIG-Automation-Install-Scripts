/* Formatted on 2/12/2019 9:51:18 AM (QP5 v5.336) */
CREATE USER csrruser
    IDENTIFIED BY oracle1;

-- Grant permissions
GRANT CREATE SESSION, RESOURCE, SELECT_CATALOG_ROLE;

-- Create table to hold the XML Stig Checklist

CREATE TABLE ora12c_chklist_xml OF XMLTYPE;

CREATE DIRECTORY SRR_XML_DIR AS 'D:\app\oracle\projects\stig\xml';   -- RDG - make sure it exists in the OS

--Run the STIG Viewer, select 'Oracle Database 12c' and click 'Create Checklist' from the top menu.  --- We may need to automate this

--Rename the new checklist file as recruits_2.xml and save it under 'D:\app\oracle\projects\stig\xml'

INSERT INTO ora12c_chklist_xml
         VALUES (
             XMLTYPE (BFILENAME ('SRR_XML_DIR', 'recruits_2.xml'),
                      NLS_CHARSET_ID ('AL32UTF8')));

COMMIT;