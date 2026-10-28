# HW4 · GitHub in 6 steps (no command line needed)

You submit this assignment through GitHub. You only need a browser.

1. **Get a GitHub account** (free) at github.com — skip if you already have one.

2. **Create your repo from the template.** Open the course template link (posted on Canvas) →
   **"Use this template" → "Create a new repository"** → name it (e.g. `data789-hw4-yourname`),
   keep it **Public**, then **Create repository**.

3. **Open a workspace to do the deploy.** In your new repo, click **Code ▸ Codespaces ▸ Create
   codespace on main** — a full environment in your browser with kubectl, the Azure CLI, and
   Minikube preinstalled. *Prefer your laptop? Clone the repo and use Docker Desktop + Minikube
   instead — either is fine.* Then follow **`README-hw4.md`**.

4. **Add your screenshots.** In your repo on github.com: **Add file ▸ Upload files** → drag your
   screenshots into a **`screenshots/`** folder → **Commit changes**. (In a Codespace, drag them
   into the file tree and use the Source Control panel.)

5. **Save your work.** Any file you change: click **Commit changes** in the web editor, or in a
   Codespace use **Source Control ▸ Commit ▸ Sync/Push**. No `git` commands required.

6. **Submit your repo URL on Canvas** (it looks like `https://github.com/you/data789-hw4-yourname`).

---

**Autograder:** every time you push, an automatic check runs — see the **Actions** tab for a
✓ or ✗. Green means your manifests are valid Kubernetes YAML with the required pieces; your
screenshots are graded by the instructor. If you see a ✗, open it, fix what it lists, and push again.
