<a name="readme-top"></a>

<div align="center">
  <h2><b>Online Mark Attendance   </b></h2>
</div>
<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 ONLINE ATTENDANCE <a name="about-project"></a>

> The Online Attendance System with QR Code Integration is designed to streamline the process of marking attendance for learners in educational settings. This system leverages QR codes to provide a quick and efficient method for both lecturers and learners to manage attendance records.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>
> This project was built with the following technologies
<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://javascript.org/">Javascript</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://ruby.com/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->
<!-- Features -->

### Key Features <a name="key-features"></a>

> The project has the following features.

- **Lecturer Performance rating**
- **Attendance Analytics**
- **QR code to mark attendance**
- **Lesson sessions for lecturer**
- **Admin Privilege to create courses and manage lecturers**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a name="live-demo"></a>
1. ### [Demo Video](https://youtu.be/zM5oGfSjVrk)
![image](https://github.com/SimonGideon/Online-Attendance/assets/61404403/2e4456c1-48a4-4aca-a5d7-d33a189c98b8)

<!-- LIVE 
> Add a link to your deployed project.

- [Live Demo Link](https://yourdeployedapplicationlink.com)
-[Live view](https://money-order-app.onrender.com)

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

To run this project you need:

<!--
Example command:
--->
```sh
 gem install rails
```
 

### Setup

Clone this repository to your desired folder:

  ```sh
  cd my-folder
  git clone git@github.com:SimonGideon/Online-Attendance.git
  ```

### Install

1. Install this project with:

  ```sh
  cd Online-Attendance
  bundle install
  ```
2. Remove Existing Credentials File.
  ```sh
  rm config/credentials.yml.enc
  rm config/master.key
  ```

3. Generate a new secrete key.
  ```sh
  rails secret
  ```
4. Remove Existing Credentials File.
  ```sh
  rm config/credentials.yml.enc
  rm config/master.key
  ```

5. Generate a new secrete key. `copy the key in the terminal you will use it in the next step`.
  ```sh
  rails secret
  ```
6. Open your credentials file and add the new secret key.
  ```sh
  EDITOR="nano" bin/rails credentials:edit
  ```

7. Add the `copied` generated secret key under `secret_key_base:`
  ```sh
  secret_key_base: your_generated_secret_key
  ```

8. After saving and closing the editor, verify that the credentials were correctly saved by running:
  ```sh
  rails credentials:show
  ```

### Usage
To run the project, execute the following command:


```sh
  rails s
```

### Run tests

To run tests, run the following command:



<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Simon Gideon**

- GitHub: [@SimonGideon](https://github.com/SimonGideon)
- Twitter: [@Simo_Giddy](https://twitter.com/Simo_Giddy)
- LinkedIn: [mnayi-gideon](https://linkedin.com/in/mnayi-gideon)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> The following will be implemented on future updates.

-  **Advance Attendance Analytics**
-  **Report Mailings**
- **Lecturer Performance tracking**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project feel free to star the projecta and request improve ment through the issues section

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank [Gregoire Vella](https://www.behance.net/gregoirevella) for the creative design that I have implemented.

<p align="right">(<a h```
 




<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Simon Gideon**

- GitHub: [@SimonGideon](https://github.com/SimonGideon)
- Twitter: [@Simo_Giddy](https://twitter.com/Simo_Giddy)
- LinkedIn: [mnayi-gideon](https://linkedin.com/in/mnayi-gideon)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> The following will be implemented on future updates.

-  **Advance Attendance Analytics**
-  **Report Mailings**
- **Lecturer Performance tracking**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).ref="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
