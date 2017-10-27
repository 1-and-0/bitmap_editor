- # Bitmap editor
- 2D Bitmap editor
- 
- # Documentation
- 
- **Create a new Bitmap**
-   You can initialize a new Bitmap by using the command I followed the rows and columns.
-   I 3 3 -> creates a bitmap of size [3 X 3] with the default colour 'O'.
-   
-   The width and the hight needed to be positive and valid integers, If not "invalid bitmap size ([x],[y])" is displayed.
- 
- **Bitmap Commands**
-   You could print or manipulate Bitmap once created by using set of commands.
-   When you try to run the commands without initializing bitmap "Bitmap not yet created" message will be displayed.
-   
-   _1. printBitmap_
-   executed with the command '**S**'
-   prints the bitmap row wise
-   starts with a '------start---------' and ends with a '---------end-------'
-   
-   ex 
-   ---start--------
-   P	O	O	O	O	O	O	K	
-   E	J	E	O	O	O	O	K	
-   F	O	O	O	O	O	O	K
-   -------end--------
- 
- 
-   
-   _2. clearBitmap_
-   replaces every pixel with color 'O' the default colour
-   executed with the command '**C**'
-   ----start--------
-   O	O	O	O	O	O	O	O	
-   O	O	O	O	O	O	O	O	
-   O	O	O	O	O	O	O	O
-   -------end--------
- 
-   
-   _3. drawPixel_
-   replaces a colour with a given pixel in a given coordinates
-   executed with the command 'L x-cooridnate y-coordinate Colour'
-   ex **L 0 0 F** replaces bitmap[0][0] to colour F.
-   ----start--------
-   F	O	O	O	O	O	O	O	
-   O	O	O	O	O	O	O	O	
-   O	O	O	O	O	O	O	O
-   -------end--------
- 
-   
-   _4. drawHorizonatalLine_
-   replaces the colour horizontally in an x-coordinate between two different y ranges.
-   executed with the commands 'H x-coordinate y1-coordinate y2-coordinate Colour'
-   ex **H 2 0 3 K**
-   ----start--------
-   F	O	O	O	O	O	O	O	
-   O	O	O	O	O	O	O	O	
-   K	K	K	K	O	O	O	O
-   -------end--------
- 
-   
-   _5. drawVerticalLine_
-   replaces the colour verically in an y-coordinate from two different x ranges.
-   executed with the commands 'V y-coordinate x1-coordinate x2-coordinate Colour'
-   ex **V 7 0 3 Z**
-   ----start--------
-   F	O	O	O	O	O	O	Z	
-   O	O	O	O	O	O	O	Z	
-   K	K	K	K	O	O	O	Z
-   -------end--------
- 
- 
- # Running
- 
- execute below to run the bitmap editor with preentered commands in show.txt
- `>bin/bitmap_editor examples/show.txt`
- 
- # Running Test
