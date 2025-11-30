# 🚀 Deploy to GitHub Pages (Free!)

Deploy your app directly to GitHub Pages for free hosting.

---

## 📋 Prerequisites

1. Your code must be on GitHub
2. Repository must be public (or use GitHub Pro)

---

## ✅ Step-by-Step Deployment

### Step 1: Install GitHub Pages Plugin

```bash
npm install --save-dev gh-pages
```

### Step 2: Update package.json

Add these scripts to your `package.json`:

```json
{
  "scripts": {
    "build": "tsc && vite build",
    "predeploy": "npm run build",
    "deploy": "gh-pages -d dist"
  },
  "homepage": "https://Ankita123-ai.github.io/Todo-App-Ankita/"
}
```

### Step 3: Update vite.config.ts

Update the base path:

```typescript
export default defineConfig({
  base: "/Todo-App-Ankita/", // Add this line
  // ... rest of config
});
```

### Step 4: Deploy

```bash
npm run deploy
```

---

## 🔧 Alternative: Manual GitHub Pages Setup

1. **Build your app**:

   ```bash
   npm run build
   ```

2. **Go to GitHub repository**: https://github.com/Ankita123-ai/Todo-App-Ankita

3. **Click**: "Settings" → "Pages"

4. **Source**: Select "GitHub Actions" or "Deploy from a branch"

5. **Branch**: Select `main` and folder `dist`

6. **Save**

---

## 🌐 Your Site URL

After deployment, your site will be at:

`https://ankita123-ai.github.io/Todo-App-Ankita/`

---

## ⚠️ Important Notes

- Repository must be **public** (unless you have GitHub Pro)
- Base path must match your repository name
- Changes take a few minutes to appear

---

**🎉 Free hosting on GitHub Pages!**
