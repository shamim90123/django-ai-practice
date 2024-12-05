from textblob import TextBlob

def analyze_sentiment(text):
    blob = TextBlob(text)
    return blob.sentiment  # Returns a Sentiment object (polarity, subjectivity)
