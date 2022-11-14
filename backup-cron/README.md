<h1>Backup Directory</h1>
<h3>1.Overview</h3>

<h5>A. backupd.sh</h5>
<p>
the inputs to the file are taken in the program itself, if we want to change the values we need to modify the .sh file<br>
targetDir -&gt; stands for the path of target directory to have a back-up<br>
backupd -&gt; path of back-up directory<br>
maxBackNums-&gt; maximum number for back-up directories in the paret directory (backupdir) <br>
</p>
<p>
The code file has function checkfirstBackup() that check the last version of the backed-up directory with the target directory, if both of them are identical so that no change happens, else back up the target one more
</p>
<p>
function checkDirsNum() mainly check for the number of the backup directories if it exceeds the max number then delete the oldest file.<br>
ls -&gt; list the content inside the directory <br>
grep ^d -&gt; filter the directories from all the file<br>
wc -l -&gt; counts the number of existing dirs.<br>
tail -1 -&gt; specify the oldest file<br>
</p>
<p>
Then we check for the the backup directory if it is not exist then the program creates it in the specific destination, then we compare the directories inside the bach-up one and make the desicion if we need to back-up the files again or not. <br>
The program makes up to 3 back-ups if the user want to modify it, he has to modify the .sh file
</p>

<h3>2. Manual to configure crone job</h3>
<p>1.Open the terminal <br>
2.Type the command: crontab -e "to create and edit the crone job"<br>
3.choose the editor you prefer ("The easiest is great")<br>
4.Write down the format that specify the time to make the crone runs the program<br>
** for running each minute => "* * * * * {path to the file}"<br>
EX: * * * * * ~/Desktop/lab1/backup-cron/source_code/backup-cron.sh
5.Save and close the file<br>
6.In order to remove the crone job from the table => "crontab -r" <br>
</p>


<h3>3. Requisites: </h3>
<p>
No requisites needed in that version.<br>
just set the values that you want in the .sh file
</p>

<h3>4. Crone Expression: </h3>
<p>Every 3rd friday of the month at 12:31 am</p>
<p>"1 31 0 ? * 6#3 *"</p>






