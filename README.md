# REST API for Finnish online stores

In difficult times, local and Finnish trade should be supported, so we have compiled a list of Finnish companies. The companies are headquartered in Finland and have been found to be reliable.

## Endpoints

| method | endpoint | result
|---|---|---|
| GET | companies | The first 50 companies.
| GET | companies/{id} | Individual company information.
| GET | companies?search=query | Search results based on company names and descriptions.
| POST | companies | Creating a new company.
| PUT | companies/{id} | Edit company's information.