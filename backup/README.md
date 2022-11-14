<h1>Backup Directory</h1>
<h3>1.Overview</h3>

<h5>A. backupd.sh</h5>
<p>
The code file starts with a function checkfirstBackup() that check the last version of the backed-up directory with the target directory, if both of them are identical so that no change happens, else back up the target one more
</p>
<p>
function checkDirsNum() mainly check for the number of the backup directories if it exceeds the max number then delete the oldest file.<br>
ls -> list the content inside the directory <br>
grep ^d -> filter the directories from all the file<br>
wc -l -> counts the number of existing dirs.<br>
tail -1 -> specify the oldest file<br>
</p>
<p>
the inputs to the file are taken as arguments<br>
currentDir -> stands for the path of target directory to have a back-up<br>
backupd -> path of back-up directory<br>
sec -> # seconds to be slept in the program <br>
maxBackNums-> maximum number for back-up directories in the paret directory (backupdir) <br>
</p>
<p>
***While [ 1 ]*** inside it sleep for seconds, compare between the last version and the target directory if there is difference a new directory is created having the new backup
</p>

<h5>B. build.sh</h5>
<p>
Create destination backup directory if not exists
</p>

<h5>C. Makefile</h5>
<p>
Makefile is used to run the scripts, make backupd.sh depends on build.sh
</p>

<h3>2. Prerequsities</h3>
<p>*installing make</p>
<h5>sudo apt install make</h5>

<h3>3. Step by step instructions</h3>
<p>After opening the folder that have the makefile, type in terminal:</p>
<h5>make pTarget={directory path} pBackup={directory path} seconds={time in seconds} maxBackup={max number of backup directories}</h5>
<p>
*Note that: type the instruction arguments without {} 
</p>







