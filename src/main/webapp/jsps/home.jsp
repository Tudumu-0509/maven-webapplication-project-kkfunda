<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Ganesh Software Company</title>
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

    .navbar .menu a {
      margin-left: 20px;
      text-decoration: none;
      color: #007b8f;
      font-weight: 600;
    }

    /* Banner */
    .banner {
      background-color: #e0f7fa;
      text-align: center;
      padding: 60px 20px;
    }

    .banner h2 {
      font-size: 36px;
      margin-bottom: 10px;
      color: #004d60;
    }

    .banner p {
      font-size: 18px;
      color: #333;
    }

    /* Services Section */
    .section-title {
      text-align: center;
      font-size: 22px;
      font-weight: 600;
      margin: 40px 0 20px;
      color: #004d60;
    }

    .services {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
      padding: 0 30px 30px;
    }

    .card {
      background-color: #ffffff;
      padding: 20px;
      border-radius: 12px;
      width: 220px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.05);
      text-align: center;
      transition: transform 0.2s;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card img {
      width: 48px;
      height: 48px;
    }

    .card h3 {
      font-size: 16px;
      color: #007b8f;
      margin-top: 10px;
    }

    /* Contact */
    .contact {
      background-color: #c8e6e8;
      text-align: center;
      padding: 40px 20px;
      margin-top: 30px;
    }

    .contact p {
      margin: 8px 0;
      font-size: 16px;
    }

    .contact a {
      color: #004d60;
      font-weight: 600;
      text-decoration: none;
    }

    footer {
      background: #007b8f;
      color: white;
      text-align: center;
      padding: 20px;
      font-size: 0.95em;
    }

    @media (max-width: 768px) {
      .services {
        flex-direction: column;
        align-items: center;
      }
      .navbar {
        flex-direction: column;
        align-items: flex-start;
      }
      .navbar .menu {
        margin-top: 10px;
      }
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <div class="navbar">
    <h1>Ganesh Software</h1>
    <div class="menu">
      <a href="#">Home</a>
      <a href="#">Services</a>
      <a href="#">Projects</a>
      <a href="#">Contact</a>
    </div>
  </div>

  <!-- Banner -->
  <div class="banner">
    <h2>Innovative Software Solutions</h2>
    <p>We build scalable, secure, and smart applications for the digital world.</p>
  <!-- Client Section -->
<div class="section-title">Our Clients</div>
<div class="services client-section">
  <div class="card client-card">
    <img src="https://img.icons8.com/ios-filled/50/company.png" alt="Client Logo" />
    <h3 class="client-name">Manesha Enterprises</h3>
    <p class="client-desc">Manesha technology partner since 2022.</p>
  </div>
</div>

<style>
  /* Client Section specific styles */
  .client-section {
    justify-content: flex-start; /* align left */
  }
  .client-card {
    border: 2px solid #4CAF50;  /* green border */
    box-shadow: 0 4px 10px rgba(76, 175, 80, 0.3); /* subtle green shadow */
    background: #e8f5e9; /* light green background */
    color: #2e7d32; /* dark green text */
  }
  .client-name {
    color: #1b5e20; /* darker green */
    font-weight: 700;
  }
  .client-desc {
    color: #4caf50;
    font-style: italic;
  }
</style>


  <!-- Services -->
  <div class="section-title">Our Expertise</div>
  <div class="services">
    <div class="card">
      <img src="https://img.icons8.com/color/48/cloud.png" alt="Cloud" />
      <h3>AWS Cloud Solutions</h3>
    </div>
    <div class="card">
      <img src="https://img.icons8.com/color/48/docker.png" alt="Docker" />
      <h3>DevOps & Docker</h3>
    </div>
    <div class="card">
      <img src="https://img.icons8.com/color/48/kubernetes.png" alt="K8s" />
      <h3>Kubernetes</h3>
    </div>
    <div class="card">
      <img src="https://img.icons8.com/fluency/48/java-coffee-cup-logo.png" alt="Java" />
      <h3>Java & Spring Boot</h3>
    </div>
    <div class="card">
      <img src="https://img.icons8.com/color/48/terraform.png" alt="Terraform" />
      <h3>Terraform IAC</h3>
    </div>
    <div class="card">
      <img src="https://img.icons8.com/ios-filled/50/github.png" alt="GitHub" />
      <h3>CI/CD Pipelines</h3>
    </div>
  </div>

  <!-- Contact -->
  <div class="contact">
    <h2>Contact Us</h2>
    <p><strong>Email:</strong> <a href="mailto:info@ganeshsoftware.com">info@ganeshsoftware.com</a></p>
    <p><strong>Phone:</strong> +91-9876543210</p>
    <p><strong>Location:</strong> Hyderabad, India</p>
  </div>

  <!-- Footer -->
  <footer>
    &copy; 2025 Ganesh Software Company. All rights reserved.
  </footer>

</body>
</html>





