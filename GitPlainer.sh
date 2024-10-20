#!/bin/bash

#This script purpose is to explain how the workflow of github works
#And set up the databases (files) that will be encrypted and pin protected to set up the workflow automation

#The goal is to make the commands go automatic with the console prompting what files we want to add,
#and what description we want to use in the commit. 

#To facilitate the use of the token it will be stored in a password/pin protected file. Which will lower the protection, 
#but it will eb boring to be always looking up for the token and i want to explore bash scripting

#To-Do
#Check for syntax on how to add colours to give examples for the heads and mains for case 6 git log
#Add a promp "press any key to continue" so the list doesnt push the text up while i am reading the explanations
#Consider remove the list time intervals and add to explanations instead
#Create condition for the variables to check if the template file exist. If it does use it as user.
#Add comments to explain everything in the code so it can also be a source to learn 

echo "Created by:"
echo " _____ _                   "
echo "/__   (_) __ _  __ _  ___  "
echo "  / /\/ |/ _\` |/ _\` |/ _ \ "
echo " / /  | | (_| | (_| | (_) |"
echo " \/   |_|\__,_|\__, |\___/ "
echo "               |___/       "


#variable user
if [-f "GitHub_User.txt"]; then
  user=$(cat GitHub_User.txt)
else
user=$(whoami)
  exit 
fi

hostname=Alfred

#The -f will return true if the file exists https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html
if [-f "GitHub_User.txt"]; then
  user=$(cat GitHub_Hostname.txt)
else
hostname=Alfred
  exit 
fi
#Code Body

echo "Computer name detected..."
sleep 1
echo "$(hostname)"
sleep 1
echo "Username detected..."
sleep 1
echo "$user"
sleep 1
echo ""
read -p "Does this $user match your GitHub username?(y/n)" answer

if [ "$answer" = "n" ]; then
  read -p "What is your user name then? " user
  echo "Let's proceed $user"
  rm GitHub_User.txt
  echo "$user" > GitHub_User.txt
elif [ "$answer" = "y" ]; then
  echo "Let's proceed $user"
else
  echo "I am sorry, I didn’t catch your answer. For 'yes' type 'y' and for 'no' type 'n'. Start over again"
  echo ""
  exit 
fi

#Host name
echo ""
echo "Hi $user, i am going to help you through this journey on your first steps using GitHub" 
sleep 1
echo ""
read -p "I think my name is $hostname, but i am not sure. Is my name correct?(y/n)" answer2

if [ "$answer2" = "n" ]; then
  read -p "What is my name then? " hostname 
  rm GitHub_User.txt
  echo "$hostname " > GitHub_Hostname.txt
  echo "You are right! My name is $hostname. Let's proceed $user"
elif [ "$answer2" = "y" ]; then
echo ""
  echo "Let's proceed $user"
  echo ""
else
  echo "I am sorry, I didn’t catch your answer. For 'yes' type 'y' and for 'no' type 'n'. Start over again"
  echo ""
  exit 1
fi


echo "Here are the topics that I can help you with:"
while true; do
  echo "1. Git Workflow"
  sleep 0.5
  echo "2. Update Local repository"
  sleep 0.5
  echo "3. Git add"
  sleep 0.5
  echo "4. Git status"
  sleep 0.5
  echo "5. Git commit"
  sleep 0.5
  echo "6. Git log"
  sleep 0.5
  echo "7. Git diff"
  sleep 0.5
  echo "8. Git push"
  sleep 0.5
  echo "9. Set your key"
  sleep 0.5
  echo "0. Exit"
  read -p "Which topic you want to learn about? " choice
  case $choice in
    0)
      exit
      ;;
    1)
      echo ""
      echo "######################"
      echo "## 1. Git Workflow  ##"
      echo "######################"
      echo ""
      echo "The workflow in git is:"
      echo "Pull > edit your project > Add > Commit > Push"
      echo "The ACT workflow refers only to the Add > Commit > Push"
      echo ""
      echo "To illustrate add will work like putting items in the shopping cart"
      echo "The commit like going to pay"
      echo "And the push when you are showing to your friends what you bought"
      echo ""
      echo "We are going to explore more in depth what is each of those parts in the other topics"
      echo ""
      sleep 1
      echo "Great! Lets move on, shall we?"
      sleep 1
      echo ""
      echo "################################"
      echo ""
      ;;
    2)
      echo ""
      echo "#################################"
      echo "## 2. Update Local repository  ##"
      echo "#################################"
      echo ""
      echo "To update our local repository we use the command <git pull>"
      echo "This command will fetch and merge the changes from the remote repository to our local repository"
      echo ""
      echo "Documentation: git pull: https://git-scm.com/docs/git-pull"
      echo ""
      sleep 1
      echo "Great! Lets move on, shall we?"
      sleep 1
      echo ""
      echo "################################"
      echo ""
      ;;
    3)
      echo ""
      echo "#################"
      echo "## 3. Git add  ##"
      echo "#################"
      echo ""
      echo "After we make the changes to files we need to add it to the staging area."
      echo "For that we use the command: git add <file_name>"
      echo "The staging area is a tool that allows you to choose which files you are going to commit in the next step."
      echo "Using it you don't have the risk to commit to your repository something you don't want."
      echo ""
      echo "Documentation: https://git-scm.com/about/staging-area"
      echo "Note: You can jump over this step by including the flag -a in the command: git commit"
      echo ""
      sleep 1
      echo "Great! Lets move on, shall we?"
      sleep 1
      echo ""
      echo "################################"
      echo ""
      ;;
    4)
      echo ""
      echo "####################"
      echo "## 4. Git status  ##"
      echo "####################"
      echo ""
      echo "The command: <git status> allows you to see what files are being tracked or not"
      echo "The files that are being tracked will be committed and the untracked files will not"
      echo "If you want to remove a file from the tracked list use the command: git restore --staged <file_name>"
      echo ""
      echo "Documentation: git status: https://git-scm.com/docs/git-status"
      echo "Documentation: git restore: https://git-scm.com/docs/git-restore"
      echo ""
      sleep 1
      echo "Great! Lets move on, shall we?"
      sleep 1
      echo ""
      echo "################################"
      echo ""
      ;;
    5)
      echo ""
      echo "####################"
      echo "## 5. Git commit  ##"
      echo "####################"
      echo ""
      echo "The <git commit> command allows you to commit the changes you tracked with the command <git add>"
      echo "It's best practices to use the flag -m to give a description of the changes you have made"
      echo ""
      sleep 1
      echo "Great! Lets move on, shall we?"
      sleep 1
      echo ""
      echo "################################"
      echo ""
      ;;
    6)
      echo ""
      echo "#################"
      echo "## 6. Git log  ##"
      echo "#################"
      echo ""
      echo "When we use the <git log> the terminal will shows us the commit history and they versions"
      echo "That version number is a SHA-1 hash (hexadecimal number) and works like a license plate or an id number"
      echo ""
      sleep 1
      echo "Great! Lets move on, shall we?"
      sleep 1
      echo ""
      echo "################################"
      echo ""
      ;;
    7)
      echo ""
      echo "##################"
      echo "## 7. Git diff  ##"
      echo "##################"
      echo ""
      echo "This command will show the differences between commits"
      echo ""
      echo "Documentation: git diff: https://git-scm.com/docs/git-diff"
      echo ""
      sleep 1
      echo "Great! Lets move on, shall we?"
      sleep 1
      echo ""
      echo "################################"
      echo ""
      ;;
    8)
      echo ""
      echo "##################"
      echo "## 8. Git push  ##"
      echo "##################"
      echo ""
      echo "The command \"git push\" will send the commited changes from your local repository to the remote repository"
      echo "This upload will result in a synchronization of the files"
      echo ""
      echo "Documentation: git push: https://git-scm.com/docs/git-push"
      echo ""
      sleep 1
      echo "Great! Lets move on, shall we?"
      sleep 1
      echo ""
      echo "################################"
      echo ""
      ;;
    9)
      echo ""
      echo "######################"
      echo "## 9. Set your key  ##"
      echo "######################"
      echo ""
      echo "I will list all the steps so you can generate your own keys:"
      echo "	1. Log in to GitHub"
      sleep 1
      echo "	2. Click in your profile picture in the top right corner"
      sleep 1
      echo "	3. Click on \"Settings\""
      sleep 1
      echo "	4. In the left menu, click on \"Developer settings\""
      sleep 1
      echo "	5. Again in the left menu of this new page click on \"Personal access tokens\""
      sleep 1
      echo "	6. Choose \"Tokens(classis)\""
      sleep 1
      echo "	7. Generate the new key"
      echo ""
      sleep 1
      echo "Great! Lets move on, shall we?"
      sleep 1
      echo ""
      echo "################################"
      echo ""
      ;;
    *)
      echo "Invalid option. Please select a number from the list."
      ;;
  esac
done

