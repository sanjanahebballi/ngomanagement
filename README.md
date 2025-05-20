# Healthcare NGO Management System

A full-stack web application for managing healthcare NGO operations, patient data, and hospital coordination.

## Features

- User Authentication & Role Management
- Patient Data Management
- Role-specific Dashboards
- Real-time Data Synchronization
- Secure Data Sharing
- HIPAA-Compliant Data Storage

## Tech Stack

### Frontend
- React with TypeScript
- Material-UI for components
- React Router for navigation
- Context API for state management

### Backend
- Node.js with Express
- TypeScript
- MongoDB for database
- JWT for authentication
- bcrypt for password hashing

## Getting Started

### Prerequisites

- Node.js (v14 or higher)
- MongoDB (v4 or higher)
- npm or yarn

### Installation

1. Clone the repository
```bash
git clone [your-repo-url]
cd healthcare-ngo-system
```

2. Install Backend Dependencies
```bash
cd server
npm install
```

3. Install Frontend Dependencies
```bash
cd ../client
npm install
```

4. Set up environment variables
Create a `.env` file in the server directory with:
```
PORT=5000
MONGO_URI=mongodb://localhost:27017/healthcare_ngo
JWT_SECRET=your-secret-key
```

### Running the Application

1. Start MongoDB service
2. Start the backend:
```bash
cd server
npm run dev
```

3. Start the frontend:
```bash
cd client
npm start
```

The application will be available at:
- Frontend: http://localhost:3000
- Backend API: http://localhost:5000

## API Documentation

### Authentication Endpoints

- POST `/api/auth/register` - Register a new user
- POST `/api/auth/login` - Login user
- GET `/api/auth/profile` - Get user profile (protected)

### Patient Endpoints

- GET `/api/patients` - Get all patients (protected)
- POST `/api/patients` - Create new patient (protected)
- GET `/api/patients/:id` - Get patient by ID (protected)
- PUT `/api/patients/:id` - Update patient (protected)
- DELETE `/api/patients/:id` - Delete patient (protected)

## Security

- Password hashing using bcrypt
- JWT-based authentication
- Role-based access control
- HIPAA-compliant data handling

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
