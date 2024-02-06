# Latitude SDK Sample Project

This is a sample project showcasing how to use the Latitude SDK. The Latitude SDK provides a set of tools to help developers build data apps on top of any database or data warehouse using just SQL and HTML.

## Demo

You can find a live demo of this project at the following URL: [Live Demo →](https://latitude.so/app/share/b592cd31-1c22-40b1-bd6c-e440d98a0ac6)

## Developing

To start developing in this project, first ensure you have the necessary dependencies installed. These include Node.js and the Latitude CLI. You can do so by running:
```
npm install -g latitude-cli
```

After cloning the repository, run the following command to spin up the dev server:
```
latitude dev
```
This will start the server in development mode, and you can access the application at `http://localhost:3000`.

## Deploying

To deploy your project to Latitude, run the following command:
```
latitude deploy
```
This will build the project and deploy it to Latitude. You can access the deployed application at the URL provided in the output of the command.

## Project Structure

The project is structured as follows:

`models` - This directory contains the SQL files that define the queries used to fetch data from the database.
`views` - This directory contains the HTML files that define the layout and interface of the application.

Additionally you'll find a `sources.yml` file in the root directory. This file defines the data sources that the project uses. You can add or remove data sources as needed.