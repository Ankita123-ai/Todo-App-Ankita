# 📤 How to Upload Your Todo App to GitHub

## ✅ EASIEST WAY - Just Double-Click!

1. **Double-click**: `SIMPLE-PUSH.bat`
   - This will run all commands automatically
   - You'll be prompted for GitHub credentials when needed

---

## 🔑 Authentication Required

When Git asks for credentials:

- **Username**: `Ankita123-ai`
- **Password**: Use a **Personal Access Token** (NOT your regular password)

### How to Get Personal Access Token:

1. Go to: https://github.com/settings/tokens
2. Click **"Generate new token (classic)"**
3. Name it: `Todo App Upload`
4. Select scope: ☑ **repo** (check this box)
5. Click **"Generate token"** at the bottom
6. **COPY** the token immediately (you won't see it again!)
7. Use this token as your password when Git prompts you

---

## 📝 Manual Commands (If Script Doesn't Work)

Open PowerShell or Command Prompt in this folder and run:

```bash
git init
git remote add origin https://github.com/Ankita123-ai/To-Do-list.git
git add .
git commit -m "Initial commit: Todo App with custom gradient background"
git branch -M main
git push -u origin main
```

---

## 🎯 Your Repository URL

After successful push, your code will be at:
**https://github.com/Ankita123-ai/To-Do-list**

---

## ❓ Troubleshooting

**Problem**: "Authentication failed"

- Solution: Use Personal Access Token, not your password

**Problem**: "Repository not found"

- Solution: Make sure the repository exists at the URL above and you have access

**Problem**: "Permission denied"

- Solution: Check you're logged in with the correct GitHub account

---

## 📂 Files Available

- `SIMPLE-PUSH.bat` - Simplest script (recommended)
- `UPLOAD-TO-GITHUB.bat` - Detailed script with instructions
- `DO-THIS-NOW.bat` - Quick script
- `push-to-github.ps1` - PowerShell version
