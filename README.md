# Flipkart Clone — Full Stack MERN App

A full-stack e-commerce web application inspired by Flipkart, built with the MERN stack (MongoDB, Express, React, Node.js). Supports product listings, user authentication, cart, orders, and payment integration.

---

## 🚀 Live Demo

🌐 [flipkart-mern.azurewebsites.net](https://flipkart-mern.azurewebsites.net)

---

##  System design

<img width="165" height="150" alt="image" src="https://github.com/user-attachments/assets/82c928aa-fe33-462f-9aa3-a75279ddc00f" />


## 🛠️ Tech Stack

**Frontend**
- React.js
- Redux + Redux Thunk
- Material UI (MUI)
- React Router DOM
- Axios
- Chart.js

**Backend**
- Node.js
- Express.js
- MongoDB + Mongoose
- JWT Authentication
- Cloudinary (image uploads)
- Stripe & Paytm (payments)
- SendGrid (emails)

**DevOps**
- Docker
- Azure Container Registry (ACR)
- Azure App Service
- GitHub Actions (CI/CD)
- MongoDB Atlas

---

## 📁 Project Structure

```
flipkart-mern/
├── backend/
│   ├── config/          # Database & environment config
│   ├── controllers/     # Route controllers
│   ├── middlewares/     # Auth & error middlewares
│   ├── models/          # Mongoose models
│   ├── routes/          # API routes
│   └── utils/           # Helper utilities
├── frontend/            # React app
├── .github/
│   └── workflows/
│       └── deploy.yml   # GitHub Actions CI/CD pipeline
├── Dockerfile           # Production Docker image
├── docker-compose.yml   # Local development setup
├── server.js            # App entry point
└── package.json
```

---

## ⚙️ Environment Variables

Create `backend/config/config.env` for local development:

```env
PORT=4000
NODE_ENV=development

# MongoDB
MONGO_URI=mongodb://localhost:27017/flipkart

# JWT
JWT_SECRET=your_jwt_secret
JWT_EXPIRE=7d
COOKIE_EXPIRE=5

# Cloudinary
CLOUDINARY_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret

# Stripe
STRIPE_API_KEY=your_stripe_key
STRIPE_SECRET_KEY=your_stripe_secret

# SendGrid
SENDGRID_API_KEY=your_sendgrid_key
```

---

## 🐳 Run Locally with Docker

Make sure Docker Desktop is running, then:

```bash
docker-compose up --build
```

App will be live at **http://localhost:4000**

To stop:
```bash
docker-compose down
```

---

## 💻 Run Locally without Docker

**Install dependencies:**
```bash
npm install
cd frontend && npm install
```

**Run in development mode:**
```bash
npm run dev
```

This starts both the backend (port 4000) and frontend (port 3000) concurrently.

---

## 🌐 Deployment — Azure

This app is deployed on **Azure App Service** using a Docker container stored in **Azure Container Registry**.

### Manual Deployment Steps

```bash
# Login to Azure
az login

# Login to ACR
az acr login --name flipkartregistry

# Build and push image
docker build -t flipkartregistry.azurecr.io/flipkart-mern:latest .
docker push flipkartregistry.azurecr.io/flipkart-mern:latest

# Restart web app
az webapp restart --name flipkart-mern --resource-group flipkart-rg
```

---

## 🔄 CI/CD Pipeline — GitHub Actions

Every push to `main` automatically:
1. Builds a fresh Docker image
2. Pushes it to Azure Container Registry
3. Deploys it to Azure App Service

### Required GitHub Secrets

| Secret | Description |
|---|---|
| `REGISTRY_LOGIN_SERVER` | `flipkartregistry.azurecr.io` |
| `REGISTRY_USERNAME` | ACR username |
| `REGISTRY_PASSWORD` | ACR password |
| `AZURE_WEBAPP_NAME` | `flipkart-mern` |
| `AZURE_PUBLISH_PROFILE` | Azure publish profile XML |

---

## 📦 API Routes

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/v1/register` | Register user |
| POST | `/api/v1/login` | Login user |
| GET | `/api/v1/products` | Get all products |
| GET | `/api/v1/product/:id` | Get product details |
| POST | `/api/v1/order/new` | Place new order |
| GET | `/api/v1/orders/me` | Get my orders |
| POST | `/api/v1/payment/process` | Process payment |

---

## 📸 Features

- 🔐 User registration & login with JWT
- 🛍️ Product listing with search & filters
- 🛒 Add to cart & wishlist
- 📦 Order placement & tracking
- 💳 Payment via Stripe & Paytm
- 🖼️ Product image upload via Cloudinary
- 📊 Admin dashboard with charts
- 📧 Email notifications via SendGrid

---

## 📄 This Flipkart-Mern stack project frontend and backend is done by https://github.com/jigar-sable/flipkart-mern.git

