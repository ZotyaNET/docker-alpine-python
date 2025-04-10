import os
import json


def create_files_from_json(json_file):
    with open(json_file, 'r') as file:
        data = json.load(file)

    for filepath, filedata in data.items():
        # Create directories if they don't exist
        os.makedirs(os.path.dirname(filepath), exist_ok=True)

        # Write the content to the file
        with open(filepath, 'w') as f:
            f.write(filedata['content'])

    # Overwrite the JSON file with an empty object
    with open(json_file, 'w') as file:
        json.dump({}, file)


if __name__ == '__main__':
    json_path = 'gpt/response.json'  # Path to the JSON file
    create_files_from_json(json_path)
    print("Files and directories created successfully.")
    print(f"Cleared the contents of {json_path}.")