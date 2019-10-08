import os
import sys
import subprocess


def split_candidates(file_path, prefix):
    with open(file_path, 'r') as file:
        lines = file.readlines()
    lines.append('\n')

    num = 1
    buffer = list()
    file_names = list()
    for line in lines:
        if line is '\n':
            if len(buffer) > 0 and buffer[0].startswith('; Static profile'):
                file_name = f'{prefix}.{num}'
                file_names.append(file_name)
                with open(f'{file_name}.opt', 'w') as file:
                    file.writelines(buffer)
                    num += 1
            buffer = list()
        else:
            buffer.append(line)
    return file_names


def batch_opt2ll(file_names):
    for file_name in file_names:
        try:
            result = subprocess.run(
                # the former uses compiled script, the latter uses raw script
                # ../../souper/build/souper2llvm ${name}.opt > ${name}.ll
                f'python souper2llvm.py {file_name}.opt > {file_name}.ll',
                check=True,
                shell=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
            )
            # print(result.stdout)
            # print(result.stderr)
        except Exception as e:
            print(e)


def main():
    try:
        file_path = sys.argv[1]
        dir_name = os.path.dirname(file_path)
        base_name = os.path.basename(file_path)
        file_name, file_ext = os.path.splitext(base_name)
        prefix = dir_name + os.path.sep + file_name
        file_names = split_candidates(file_path, prefix)
        batch_opt2ll(file_names)
    except Exception as e:
        print(e)


main()
