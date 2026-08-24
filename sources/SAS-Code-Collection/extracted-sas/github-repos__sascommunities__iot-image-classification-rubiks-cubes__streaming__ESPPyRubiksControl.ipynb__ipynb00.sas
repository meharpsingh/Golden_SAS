/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__iot-image-classification-rubiks-cubes/streaming/ESPPyRubiksControl.ipynb (ipynb 0) */

#
# read the data from the URL;
#
import urllib.request
# open a connection to a URL using urllib

#get the result code and print it
print ("result code: " + str(webUrl.getcode()))

# read the data from the URL and print it;
data = webUrl.read();
data = data.decode('UTF-8')  # decode bytes to str;
#print (data);
run;
