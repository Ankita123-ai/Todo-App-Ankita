# 🆕 Create New GitHub Repository and Push Code

## 📝 Step-by-Step Instructions

### Step 1: Create New Repository on GitHub

1. **Go to**: https://github.com/new

   - Or click the "+" icon in GitHub → "New repository"

2. **Fill in the details**:

   - **Repository name**: Choose one:
     - `Todo-App-Ankita`
     - `Ankita-Todo-List`
     - `My-Todo-App`
     - Or any name you prefer (no spaces, use hyphens)
   - **Description**: "Todo App with custom gradient background"
   - **Visibility**:
     - ☑ Public (anyone can see)
     - ☐ Private (only you can see)
   - **Important**:
     - ❌ DO NOT check "Add a README file"
     - ❌ DO NOT add .gitignore
     - ❌ DO NOT choose a license
     - **Keep it completely EMPTY!**

3. **Click**: "Create repository"

---

### Step 2: Push Your Code

After creating the empty repository, you have two options:

#### Option A: Use the Script (Easiest)

1. **Double-click**: `PUSH-TO-NEW-REPO.bat`
2. Enter the repository name when prompted
3. Follow the instructions
4. Enter GitHub credentials when asked

#### Option B: Manual Commands

Open PowerShell in your project folder and run:

```bash
# Replace REPO_NAME with your actual repository name
git init
git remote add origin https://github.com/Ankita123-ai/REPO_NAME.git
git add .
git commit -m "Initial commit: Todo App with custom gradient background"
git branch -M main
git push -u origin main
```

**Replace `REPO_NAME` with your actual repository name!**

---

## 🔑 Authentication

When Git asks for credentials:

- **Username**: `Ankita123-ai`
- **Password**: Use a **Personal Access Token**

### Get Personal Access Token:

1. Go to: https://github.com/settings/tokens
2. Click **"Generate new token (classic)"**
3. Name: `Todo App Upload`
4. Scope: ☑ **repo** (check this box)
5. Click **"Generate token"**
6. **COPY** the token (you won't see it again!)
7. Use it as your password

---

## ✅ Suggested Repository Names

- `Todo-App-Ankita` ✅
- `Ankita-Todo-List` ✅
- `My-Todo-App` ✅
- `Ankita-Todo-App` ✅
- `Todo-List-Custom` ✅

**Rules for repository names:**

- Use letters, numbers, hyphens, and underscores only
- No spaces
- All lowercase or mixed case is fine

---

## 🎯 After Pushing

Your code will be available at:
**https://github.com/Ankita123-ai/YOUR-REPO-NAME**

Replace `YOUR-REPO-NAME` with your actual repository name.

---

## ❓ Troubleshooting

**"Repository not found"**

- Make sure you created the repository on GitHub first
- Check the repository name matches exactly

**"Repository is not empty"**

- Delete the repository on GitHub
- Create a new one without README or any files

**"Authentication failed"**

- Use Personal Access Token, not your password
- Make sure token has "repo" scope

---

## 📂 Files Available

- `PUSH-TO-NEW-REPO.bat` - Simple script (recommended)
- `CREATE-NEW-REPO-AND-PUSH.bat` - Interactive script with prompts
- This file: `INSTRUCTIONS-NEW-REPO.md`
