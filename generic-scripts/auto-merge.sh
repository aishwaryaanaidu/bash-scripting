target_branch="dev"
source_branch="main"
temp_branch=""

# Check if your current branch is integration. If not, checkout to target_branch
branch=$(git symbolic-ref --short -q HEAD)
if [ "$branch" != "$target_branch"]
then
    git checkout $target_branch
fi

# Create a new temporary branch from target_branch
head_commit_id=$(git rev-parse HEAD)
temp_branch="temp-merge-branch-$head_commit_id"
git checkout -b $temp_branch

# Check if your working directory is clean. --porcelain returns an empty string if the working directory is clean.
if [ -z "$(git status --porcelain)" ]
then
    echo "Your working directory is clean. Proceeding further..."
else
    echo "Please clean your working directory"
    exit
fi

git pull origin $source_branch

# Checks if there are no merge conflicts
if [ -z "$(git ls-files -u)" ]
then
    git push origin $temp_branch
    git checkout $target_branch
    git merge $temp_branch
fi
