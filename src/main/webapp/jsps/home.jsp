<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Ganesh Hospital</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background-color: #f6f9fc;
      color: #333;
    }

    /* Navbar */
    .navbar {
      background-color: #ffffff;
      padding: 15px 30px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .navbar h1 {
      color: #007b8f;
      font-size: 24px;
      margin: 0;
    }

    .navbar .actions {
      display: flex;
      align-items: center;
      gap: 20px;
    }

    .navbar .actions a {
      text-decoration: none;
      color: #007b8f;
      font-weight: 600;
    }

    /* Search Bar */
    .search-bar {
      background-color: #e3f2f7;
      padding: 40px 20px;
      text-align: center;
    }

    .search-bar input {
      padding: 10px 20px;
      width: 60%;
      max-width: 400px;
      border: 1px solid #ccc;
      border-radius: 30px;
      font-size: 16px;
    }

    /* Services */
    .services {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
      padding: 30px;
    }

    .card {
      background-color: #ffffff;
      padding: 20px;
      border-radius: 15px;
      width: 180px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.05);
      text-align: center;
      transition: transform 0.2s;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card h3 {
      font-size: 16px;
      color: #007b8f;
      margin-top: 10px;
    }

    /* Section Title */
    .section-title {
      text-align: center;
      font-size: 22px;
      font-weight: 600;
      margin-top: 30px;
      color: #004d60;
    }

    /* Browse Health Conditions */
    .health-conditions {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
      gap: 20px;
      padding: 20px 40px 40px;
    }

    .condition-card {
      background-color: #fff;
      padding: 15px;
      border-radius: 12px;
      text-align: center;
      box-shadow: 0 4px 8px rgba(0,0,0,0.05);
      font-size: 14px;
      font-weight: 500;
      color: #333;
    }

    footer {
      background: #007b8f;
      color: white;
      text-align: center;
      padding: 15px;
      margin-top: 40px;
    }

    @media (max-width: 600px) {
      .search-bar input {
        width: 90%;
      }
      .card, .condition-card {
        width: 100%;
      }
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <div class="navbar">
    <h1>Ganesh Hospital</h1>
    <div class="actions">
      <a href="#">Login</a>
      <a href="#">Contact</a>
    </div>
  </div>

  <!-- Search -->
  <div class="search-bar">
    <input type="text" placeholder="Search for Services, Doctors, or Conditions..." />
  </div>

  <!-- Service Cards -->
  <div class="services">
    <div class="card">
      <img src="https://img.icons8.com/doodle/48/doctor.png" alt="Doctor" />
      <h3>Doctor Appointment</h3>
    </div>
    <div class="card">
      <img src="https://img.icons8.com/fluency/48/laboratory.png" alt="Lab" />
      <h3>Lab Tests</h3>
    </div>
    <div class="card">
      <img src="https://img.icons8.com/color/48/insurance.png" alt="Insurance" />
      <h3>Health Insurance</h3>
    </div>
    <div class="card">
      <img src="https://img.icons8.com/color/48/pharmacy-shop.png" alt="Pharmacy" />
      <h3>Pharmacy Near Me</h3>
    </div>
    <div class="card">
      <img src="https://img.icons8.com/color/48/stethoscope.png" alt="Care" />
      <h3>24x7 Emergency</h3>
    </div>
  </div>

  <!-- Browse by Health Conditions -->
  <div class="section-title">Browse by Health Conditions</div>
  <div class="health-conditions">
    <div class="condition-card">Diabetes Care</div>
    <div class="condition-card">Cardiac Care</div>
    <div class="condition-card">Stomach Care</div>
    <div class="condition-card">Pain Relief</div>
    <div class="condition-card">Oral Care</div>
    <div class="condition-card">Respiratory</div>
    <div class="condition-card">Sexual Health</div>
    <div class="condition-card">Elderly Care</div>
    <div class="condition-card">Liver Care</div>
    <div class="condition-card">Cold & Immunity</div>
  </div>

  <!-- Footer -->
  <footer>
    &copy; 2025 Ganesh Hospital. Designed with care for healthier lives.
  </footer>

</body>
</html>




