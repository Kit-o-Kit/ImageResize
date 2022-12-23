from PIL import Image

#define image path
image = Image.open(r"C:\Users\julia\Downloads\windows_xp_bliss-wide.jpg")
#define image size
MAX_SIZE = (100, 100)

#resize the image
image.thumbnail(MAX_SIZE)

#save the image as png. can be changed to other file type.
image.save('resizedImage.png')

#open the image after it got resized
#image.show()