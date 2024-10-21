import os
import re

def add_layout_to_frontmatter(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()

    # Check if frontmatter exists
    frontmatter_pattern = re.compile(r'^---\s*\n(.*?)\n---\s*\n', re.DOTALL)
    frontmatter_match = frontmatter_pattern.match(content)

    if frontmatter_match:
        # Frontmatter exists, add layout attribute if not present
        frontmatter = frontmatter_match.group(1)
        if 'layout:' not in frontmatter:
            new_frontmatter = frontmatter.rstrip() + '\nlayout: note\n'
            content = content.replace(frontmatter, new_frontmatter, 1)
    else:
        # No frontmatter, add new frontmatter with layout attribute
        content = f'---\nlayout: note\n---\n\n{content}'

    # Write the modified content back to the file
    with open(file_path, 'w', encoding='utf-8') as file:
        file.write(content)

def process_directory(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.md'):
                file_path = os.path.join(root, file)
                add_layout_to_frontmatter(file_path)
                print(f"Processed: {file_path}")

# Set the path to the @ucla/notes folder
notes_path = os.path.join('ucla/Y4/Y4Q1')

# Process all .md files in the folder and its subfolders
process_directory(notes_path)

print("Finished processing all .md files.")
