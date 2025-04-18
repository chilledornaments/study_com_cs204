import csv
import glob
import mysql.connector

# cnx = mysql.connector.connect(
#     host="127.0.0.1",
#     port=3306,
#     user="root",
#     password="root",
#     database="MyLibrary"
# )


files_to_process = sorted(glob.glob("./data/*.txt"))

for file in files_to_process:
    print(f"processing {file}")
    table_name = file.split("/")[2].split(".")[0].split("_")[1]
    idx = file.split("/")[2].split(".")[0].split("_")[0]


    with open(file, "r") as f:
        contents = f.readlines()

        schema = [
            l.strip('\t').strip('\n') for l in contents[0].split(" ")[1:]
        ]

        query = f"""
USE MyLibrary;

INSERT INTO {table_name}
({','.join(schema)})
VALUES
"""
        for line in contents[1:]:
            split_line = line.split("\t")
            values = [
                f"'{l.strip('\t').strip('\n').strip(' ').replace("'", "''")}'" for l in split_line[1:]
            ]

            s = [f"%s" for i in values]

            query += f"""
({','.join(values)}),
            """


        # 14 chars to remove last comma
        with open(f"./ddl/0{idx}_{table_name}.sql", "w+") as f:
            f.write(query[0:len(query)-14])
