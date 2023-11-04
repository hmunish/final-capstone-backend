# Final group capstone - Book an Appointment For Renting Car

<a name="readme-top"></a>

<div align="center">
<h2>ER Diagrma</h2>
<img width="741" alt="Screenshot 2023-09-25 at 12 07 22" src="./ER Diagram Final capstone.PNG">

</div>

# 📗 Table of Contents

- [Final group capstone - Book an Appointment For Renting Car](#final-group-capstone---book-an-appointment-for-renting-car)
- [📗 Table of Contents](#-table-of-contents)
- [📖 Final group capstone - Book an Appointment ](#-final-group-capstone---book-an-appointment-)
  - [🚀 Frontend App ](#-frontend-app-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [🚀 Live Demo ](#-live-demo-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Run rails](#run-rails)
  - [👥 Authors ](#-authors-)
  - [📆 Kanban Board ](#-kanban-board-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
    - [Development Team](#development-team)
    - [Institution](#institution)
    - [Reference Design](#reference-design)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 Final group capstone - Book an Appointment <a name="about-project"></a>

**[Description]**

The project we built for the Final Project is based on an app to book an appointment for the best car in the world.

## 🚀 Frontend App <a name="frontend"></a>

- [Click here to navigate to the Frontend ](https://github.com/hmunish/final-capstone-frontend)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

- Ruby on Rails >=7
- React
- Postgres

### Key Features <a name="key-features"></a>

- Connection between Ruby on Rails and React in different apps
- Book an appointment to try a car
- Cars that you selected as a theme
- Reserve form

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

- [Live Demo Link](https://car-booking-frontend.onrender.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

### Prerequisites

- [Ruby on Rails >=7](https://rubyonrails.org/)
- [React](https://reactjs.org/)
- [Postgres](https://www.postgresql.org/)
- [Git](https://git-scm.com/downloads)

### Install

```
git clone https://github.com/hmunish/final-capstone-backend.git
cd final-capstone-backend
bundle install
```

```
git clone https://github.com/hmunish/final-capstone-frontend.git
cd final-capstone-frontend
npm install
```

### Usage

In the project directory, run the first time:

```
bundle exec rake assets:precompile
```

then, you can use:

```
./bin/dev
```

or:

```
rails s
```

Check on db/seed.rb for pre-loaded users, groups and, spendings, and likes for development

### Run tests

In the project directory, run the first time:

```
bundle exec rake assets:precompile
```

then, you can:

```
rspec .
```

however, if you haven't run

```
./bin/dev
```

### Run rails

To configure the database connection in Rails, you need to update the database.yml file located in the config folder. Follow these steps: Locate the database.yml file in the config folder of your Rails application.

1. Open the database.yml file using a text editor.

2. Find the default: &default section in the file.

3. Add the following lines under the default: &default section:

```
  host: localhost
  username: your_username
  password: your_password
```

4. Replace your_username with your actual database username and your_password with your actual database password.
5. Save the changes to the database.yml file.
6. Run

```
rails db:create
```

```
rails db:migrate
```

```
rails db:seed
```

```
rails s
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Abdourahmane Jalloh**

- GitHub: [aradradev](https://github.com/aradradev)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/abdul-jalloh)

👤 **Faranosh Amini**

- GitHub: [FaranoshAmini](https://github.com/FaranoshAmini)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/faranosh-amini-9b925b23a/)

👤 **Munish Halai**

- GitHub: [hmunish](https://github.com/hmunish)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/munish-halai/)

👤 **Sunga Thawethe**

- GitHub: [sunga12](https://github.com/sunga12)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/sungabanja-thawethe/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Kanban Board -->

## 📆 Kanban Board <a name="kanban-board"></a>

- [Our kanban board](https://github.com/hmunish/final-capstone-backend/projects/1)
- [Kanban board initial state image](https://user-images.githubusercontent.com/121902704/278095332-df4fd7fb-f38b-4213-9175-4cf6c4edef52.PNG)
- We are a team of 4 members as stated in the authors section

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- Add different categories of Cars
- Add online shopping
- Add extra styling

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you found this project helpful, consider giving a ⭐️!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

We would like to express our deepest gratitude to all the people and institutions that have contributed to make this project possible.

#### Development Team

- **Abdourahmane Jalloh**: Thank you for your dedication and hard work throughout this project.
- **Faranosh Amini**: Your expertise and commitment have been invaluable to the team.
- **Munish Halai3**: Your contributions have made a significant impact on our success.
- **Sunga Thawethe**: Your skills and teamwork have been much appreciated.

Thank you, team, for your collaboration and effort! 🙌🏼🚀

#### Institution

- **Microverse**: My sincerest thanks for creating this bootcamp. The program's structure and the quality of education provided have been crucial for my growth as a developer.

#### Reference Design

- I would also like to thank [<a href="https://www.behance.net/muratk">Murat Korkmaz</a>] for the original design on Behance that served as inspiration for this project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
