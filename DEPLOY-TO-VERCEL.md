# 🚀 Deploy to Vercel (Super Fast!)

Vercel is great for React apps and provides excellent performance.

---

## ✅ Option 1: Deploy via Vercel Website

### Step 1: Push Code to GitHub

Make sure your code is on GitHub:

- Repository: `Ankita123-ai/Todo-App-Ankita`

### Step 2: Deploy

1. **Go to**: https://vercel.com/
2. **Sign up/Login** with GitHub
3. **Click**: "Add New Project"
4. **Import** your GitHub repository: `Todo-App-Ankita`
5. **Configure** (usually auto-detected):
   - Framework Preset: **Vite**
   - Build Command: `npm run build`
   - Output Directory: `dist`
   - Install Command: `npm install`
6. **Click**: "Deploy"

**Done!** Your site will be live in ~1 minute! 🎉

You'll get a URL like: `https://todo-app-ankita.vercel.app`

---

## ✅ Option 2: Deploy via Vercel CLI

### Install Vercel CLI:

```bash
npm install -g vercel
```

### Deploy:

```bash
# Login
vercel login

# Deploy (first time - follow prompts)
vercel

# Deploy to production
vercel --prod
```

---

## 🔧 Configuration

Create `vercel.json` in your project root (optional):

```json
{
  "buildCommand": "npm run build",
  "outputDirectory": "dist",
  "devCommand": "npm run dev",
  "installCommand": "npm install",
  "framework": "vite"
}
```

But Vercel usually auto-detects Vite, so this might not be needed!

---

## 🌐 Custom Domain

1. Go to your project on Vercel
2. Click "Settings" → "Domains"
3. Add your custom domain

---

**🎉 Vercel is super fast and perfect for React apps!**
