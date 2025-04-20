"""
This is a hacky script to take copy-pasted data from the [assignment](https://study.com/academy/lesson/database-programming-assignment-creating-manipulating-a-database.html) and generate SQL to add the data

"""

import glob

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


        with open(f"./ddl/0{idx}_{table_name}.sql", "w+") as f:
            # 14 chars to remove last comma
            query = query[0:len(query)-14]
            query += "\n;" # add trailing ;
            f.write(query)
