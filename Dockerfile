FROM pytorch/pytorch
WORKDIR /source

# Additional commands.
RUN pip install transformers


# Install dependencies.
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Copy remaining code.
COPY . .

# Run code.
CMD ["python", "-u"]