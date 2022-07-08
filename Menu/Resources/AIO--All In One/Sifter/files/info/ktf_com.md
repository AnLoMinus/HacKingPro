# KatanaFramework Runtime Variables
# Commands

|Command________________|Quick Command_______________|Description|
------------------------|----------------------------|-------------------------------------|
show modules____________|showm_______________________|Show modules 
show options____________|sop_________________________|Show options module
show full options_______|sfop________________________|Show full options module
use_____________________|use_________________________|Use module 
getinfo_________________|getinfo_____________________|Show information of module
set_____________________|set_________________________|Change valor of a parameter
back____________________|back________________________|Backing or return
run_____________________|run_________________________|run Module
update__________________|u___________________________|Update framework
exit____________________|x___________________________|Exit of framework
invoke__________________|____________________________|Open a module in one new console 
help____________________|h___________________________|Show help
session_________________|____________________________|Session command
clear___________________|c___________________________|Clear screen
s::_____________________|s::_________________________|Save Variable
x::_____________________|x::_________________________|Execute System Commands
f::_____________________|f::_________________________|Execute Functions


## f::

Functions can be called with 'f::'. They allow the user to do more complex things from within the framework. 

If the function has arguments, they are listed after the().

|Name___________________|Parameters___________________|Description_______________________|
------------------------|-----------------------------|----------------------------------|
get_aps()_______________|Interface, timeout___________|Scan Access point's
get_interfaces()________|None_________________________|Get Network Interfaces
get_monitors_mode()_____|None_________________________|Get Monitor Interfaces Wireless
start_monitor()_________|Interface____________________|Start Monitor Mode in Interface
get_local_ip()__________|None_________________________|Get local IP
get_external_ip()_______|None_________________________|Get External IP
get_gateway()___________|None_________________________|Get Gateway/Router IP


### USE

     f::Functions(Parameters)   <-->  f::get_aps(mon0,10)
     f::Functions               <-->  f::get_local_ip

## x::

Execute System Commands

### USE

     x::ls -a