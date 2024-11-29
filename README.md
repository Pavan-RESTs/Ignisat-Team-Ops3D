# Ignisat - An AI-Powered IoT CubeSat for Urban Heat Island (UHI) Mitigation

## Introduction to Urban Heat Island (UHI)

**Urban Heat Island (UHI)** refers to the phenomenon where urban areas exhibit higher temperatures than their surrounding rural regions due to anthropogenic activities. This temperature disparity arises from heat-absorbing surfaces (like asphalt and concrete), reduced vegetation, and localized climate imbalances.

### Consequences of UHI:

- **Energy Strain**: Increased demand for cooling in urban centers leads to higher energy consumption, straining power grids and raising operational costs.  
- **Health Risks**: Elevated temperatures amplify air pollution, exacerbate heat-related illnesses, and disproportionately affect vulnerable populations.  
- **Water Resource Depletion**: UHI intensifies water demand, depleting supply and impacting water quality.  
- **Biodiversity Disruption**: Urban heat creates inhospitable environments for local flora and fauna, disrupting ecosystems and reducing biodiversity.

---

## Ignisat Overview

**Ignisat** is a cutting-edge **1U CubeSat** integrating IoT sensors and camera modules to monitor UHI phenomena from an aerial perspective. The satellite collects multi-modal data, which is processed using AI-based models to derive actionable insights. The system is complemented by a ground station software capable of real-time data visualization, analysis, and predictive modeling.

![Ignisat](https://i.ibb.co/5MCBBJc/payload-Image1.jpg)

### Satellite Configurations

- **Controller**: ESP32 microcontroller for sensor data aggregation and satellite control.
- **Sensors**:
  - MQ2, MQ7, MQ9, MQ135: Gas sensors for monitoring air quality metrics like CO2, SO2, NH3, and CH4.
  - DHT11: Temperature and humidity sensor for atmospheric data collection.
- **Communication**:
  - LoRa WAN module for long-range, low-power data transmission.
  - Alfa adapter for frequency modulation.
- **Imaging**: OV7670 camera module for capturing ground imagery.

---

## Ground Station Software

The Ignisat ground station software/web application, built using **Flutter**, serves as the primary interface for data reception, visualization, and analysis. It employs **Flask** and **Ngrok** for seamless communication and secure data tunneling.

### Features:

1. **Real-Time Data Transmission**:  
   - Receives telemetry data via **LoRa WAN**.
   - Displays real-time values for **Temperature**, **Humidity**, **CO2**, **SO2**, **NH3**, and **CH4**.

2. **UHI Index Prediction**:  
   - Utilizes a trained **Random Forest Regressor** to calculate the **UHI Index** with an accuracy of **87%**, achieved using the Puducherry dataset and optimized through **Grid Search CV**.

   ![UHI Index Prediction](https://i.ibb.co/KKDF52D/Screenshot-2024-11-29-185044.png)

3. **Mitigation Strategies**:  
   - Leverages **Google Gemini** to infer mitigation strategies based on real-time environmental data.

   ![Mitigation Strategies](https://i.ibb.co/ZJTWCSf/Screenshot-2024-11-29-185057.png)

4. **Heatmap Visualization**:  
   - Generates heatmaps of urban areas using **Google Maps API**, offering insights into temperature variations.

   ![Heatmap](https://i.ibb.co/yBgBBkf/Screenshot-2024-11-29-185020.png)

5. **Data Analysis and Visualization**:  
   - Provides a live, asynchronously updating line graph to visualize historical and real-time data trends.

   ![Data Visualization](https://i.ibb.co/yXkpd2Z/Screenshot-2024-11-29-185729.png)

6. **Alert Mechanism**:  
   - Implements a cloud-based notification system using **Firebase** to alert local NSS authorities when UHI levels cross critical thresholds.

   ![Notification](https://i.ibb.co/HTLvmcd/Screenshot-2024-11-29-192758.png)

**Received Notification Example**:  
<br>
<img src="https://i.ibb.co/5LF5s5K/Whats-App-Image-2024-11-29-at-19-29-45-eb9c564a.jpg" alt="Ignisat" width="140" height="300">


---

## Research and Technical Articles

Explore detailed insights into the concepts and technologies that power Ignisat:

- [Urban Heat Island Effect](https://drive.google.com/file/d/1nuGT38d7sCbpq59B1szsDRSNhjR_SWXC/view?usp=sharing)  
- [Remote Sensing & Geo-Spatial Monitoring of UHI](https://drive.google.com/file/d/13DlDsS2lfe_DxtnjN3i8zr_xYseERqMm/view?usp=sharing)  
- [Communication Using LoRa](https://drive.google.com/file/d/1egfYwl2gM3ss1oWlXjWZVrIslJAqpoJJ/view?usp=sharing)  
- [Satellite Image Analysis Using Deep Learning](https://drive.google.com/file/d/1I00nb93PG5RF80Xxrd6ZHD_4oLrmkuOx/view?usp=sharing)  

---

## Future Enhancements

Ignisat aims to evolve with the following capabilities:  
- **Enhanced Data Processing**: Integration of edge AI for onboard data analysis to reduce transmission latency.  
- **High-Resolution Imaging**: Upgrade to advanced imaging sensors for precise spatial analysis.  
- **Global Deployment**: Deploy multiple CubeSats for global UHI monitoring and mitigation.

---

## Contributors

- **[Pavan](#)** (Lead Developer & ML Specialist)  
- **Team Ignisat**

--- 

## License

This project is licensed under the [MIT License](LICENSE).
