# Use a slim Python base image
FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    portaudio19-dev \
    libasound-dev \
    # Add other system dependencies as needed, e.g., libgfortran5 for numpy
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the Streamlit application code
COPY . .

# Expose the default Streamlit port
EXPOSE 8501
# Command to run the Streamlit app with environment variables
# The actual environment variables will be passed during `docker run` on EC2
CMD ["streamlit", "run", "S3_Audio_Translation/newapp.py", "--server.port=8501", "--server.address=0.0.0.0"]