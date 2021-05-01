![Screen](https://github.com/atomatoe/ft_service/blob/master/screenshots/subj.png)

________________________________________________________________

#### <p align=center> Знакомство с Kubernetes. Кластаризация.</p> ####
________________________________________________________________

<details>
<summary>Описание задачи</summary>

________________________________________________________________

<p>Нужно будет настроить мультисервисный кластер.</p>
<p>1. Каждая служба должна будет работать в выделенном контейнере;</p>
<p>2. Каждый контейнер должен иметь то же имя, что и соответствующий service;</p>
<p>3. Контейнеры должны быть построены с использованием Alpine Linux;</p>
<p>4. Потребуется написанный Dockerfile, который вызывается в setup.sh;</p>
<p>5. Нужно реализовать контейнеры:</p>
<details>
  <p></p>
  <p>1. Load Balancer - балансировщик нагрузки;</p>
  <p>2. WordPress - развернуть сайт на nginx и связать с дб MySQL, обе службы должны работать в отдельных контейнерах;</p>
  <p>3. phpMyAdmin - связанный с MySQL, отдельный контейнер;</p>
  <p>4. FTPS;</p>
  <p>5. Grafana + InfluxDB + Telegraf - в разных контейнерах;</p>
</details>
<p>6. Load Balancer должен быть единственной точкой входа в кластер.</p>
________________________________________________________________
</details>

<details>
<summary>Screenshot</summary>

________________________________________________________________

<p><img src="https://github.com/atomatoe/ft_service/blob/master/screenshots/wordpress.jpg" alt="Ссылка"></p>
<p><img src="https://github.com/atomatoe/ft_service/blob/master/screenshots/filezilla.png" alt="Ссылка"></p>
<p><img src="https://github.com/atomatoe/ft_service/blob/master/screenshots/phpmyadmin.jpg" alt="Ссылка"></p>
________________________________________________________________

</details>
