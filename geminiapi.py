# Import the Python SDK
import google.generativeai as genai
import os
# Used to securely store your API key
#from google.colab import userdata

#GOOGLE_API_KEY=userdata.get('AIzaSyCMUMrrnvSzcGzbcKvynyYXc9w6jIVGs8k')

GOOGLE_API_KEY = 'AIzaSyCMUMrrnvSzcGzbcKvynyYXc9w6jIVGs8k'
genai.configure(api_key=GOOGLE_API_KEY)

model = genai.GenerativeModel('gemini-pro')
#response = model.generate_content("Write a story about a magic backpack.")
#print(response.text)

# Upload the file.
audio_file = genai.upload_file(path='audio.mp3')

# Initialize a Gemini model appropriate for your use case.
model = genai.GenerativeModel(model_name="gemini-1.5-flash")



# Create the prompt.
prompt = "consider you are a receptionist to a therapist and this is the audio you receive. Now give initial counselling to the patient and calm and make him comfortable. then if its emergency then let the therapist know and ask him to call 911 if its life threat"

# Pass the prompt and the audio file to Gemini.
response = model.generate_content([prompt, audio_file])

# Print the response.
print(response.text)