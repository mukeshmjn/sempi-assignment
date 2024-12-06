Marketplace Integration Services
This project implements a basic integration with two marketplaces (MarketplaceA and MarketplaceB). The services handle product and inventory management operations, such as creating items, publishing them, and retrying requests in case of failure.

Setup Instructions
Clone the Repository:

bash
Copy code
git clone <repository_url>
cd <repository_name>
Install Dependencies: Ensure you have Ruby installed on your system. Then, install the required gems using Bundler:

bundle install

Run the Application: Use the appropriate Ruby commands to interact with the services in a testing environment.

Brief Explanation of the Approach
Structure
Api Class:

Handles HTTP communication with Faraday.
Provides methods (post, put, get) to send requests.
Includes error handling and response parsing.
MarketplaceAService:

Provides functionality for managing products in MarketplaceA.
Includes a method create_product to create a new product by making a POST request to the MarketplaceA API.
MarketplaceBService:

Provides functionality for managing inventory in MarketplaceB.
Includes:
create_item: Creates a new item in the inventory.
publish_item: Publishes an item to make it available in the marketplace.
Implements retry logic with a 2-second delay for handling transient errors.
Error Handling
The Api class raises an exception for HTTP 500 errors.
Both services use a retry mechanism for transient errors, with up to 3 retries and a 2-second delay between attempts.
Assumptions Made
Endpoints:

Base URLs and endpoints are assumed to follow the format given in the code. For example:
http://localhost:3001/api/products
http://localhost:3002/inventory
Endpoint structure is consistent across marketplaces.
Error Handling:

Only HTTP 500 errors are considered retryable.
Other HTTP errors are not explicitly handled and may cause the program to raise exceptions.
Headers:

All API requests are sent with a Content-Type: application/json header.
Additional headers or authentication mechanisms are not considered.
Local Development:

The base URLs point to localhost for development purposes.


Ideas for Improvements
If given more time, the following enhancements could be made:

Improved Error Handling:

Handle specific HTTP error codes like 400 (Bad Request) or 404 (Not Found) with descriptive error messages.
Implement exponential backoff for retries instead of a fixed delay.
Logging:

Add structured logging for better observability of API requests and responses.
Include a centralized logging mechanism for better monitoring and debugging.
Authentication:

Test Coverage:

Write RSpec tests for the services and the Api class to ensure robustness.
Include both unit and integration tests.
Configurable Settings:

Move retry attempts and delay durations to a configuration file or environment variables for flexibility.
Scalability:

Add asynchronous processing for API calls to handle larger volumes of requests without blocking the main thread.
Error Reporting:

Integrate with tools like Sentry or Rollbar to report and track errors in real time.