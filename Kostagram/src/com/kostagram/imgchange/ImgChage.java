package com.kostagram.imgchange;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.MediaTracker;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.File;

import javax.imageio.ImageIO;

 
public class ImgChage {
       	public static Image resizing(Image soruce, int width, int height)
                    throws Exception {
             int newW = width;
             int newH = height;
 
             return soruce.getScaledInstance(newW, newH, Image.SCALE_SMOOTH);
       }
 
       public void change(String originalFile, String changeFile){
             String imgResdFile = originalFile;
             String imgWriteFile = changeFile+".jpg";
             try {
                    // img = ImageIO.read( new File(fName));
                    FileInputStream fis = new FileInputStream(imgResdFile);
                    byte[] data = new byte[fis.available()];
                    
                    fis.read(data);
                    fis.close();
 
                    Image image = Toolkit.getDefaultToolkit().createImage(data);
                                 
                    
                    MediaTracker tracker = new MediaTracker(new java.awt.Frame());
                    tracker.addImage(image, 0);
                    tracker.waitForAll();
                    
                    double width = image.getWidth(null); //가로
                    double height = image.getHeight(null); //세로
                    
                    int minussize = 0;
                    
                    int startwidth = 0;
                    int startheight = 0;
                    
                    double sizebi = 0;
                    if(width > height)
                    {
                    	minussize = (int) (width-400);
                    	sizebi = width/height;
                    	width = 400;
                    	height = height - (int) (minussize / sizebi);
                    	startheight = (int)(400 - height)/2;
                    }
                    else
                    {
                    	minussize = (int) (height-400);
                    	sizebi = height/width;
                    	height = 400;
                    	width = width- (int) (minussize / sizebi);
                    	startwidth = (int)(400 - width)/2;
                    }
                   
                    Image rtnImage = resizing(image, (int)width, (int)height);
                    
                    tracker.removeImage(image, 0);
                    tracker.addImage(rtnImage, 0);
                    tracker.waitForAll();
                    
                    
                    BufferedImage bi = new BufferedImage(400, 400, BufferedImage.TYPE_INT_RGB);
                    Graphics g = bi.getGraphics();
                    
                    g.setColor(Color.WHITE);
                    
                    g.drawImage(rtnImage, startwidth, startheight, null);
                    g.dispose();
                    ByteArrayOutputStream bas = new ByteArrayOutputStream();
                    ImageIO.write(bi, "jpeg", bas);
                    byte[] writeData = bas.toByteArray();
 
                    DataOutputStream dos = new DataOutputStream(
                                 new BufferedOutputStream(new FileOutputStream(imgWriteFile)));
                    dos.write(writeData);
                    File df = new File(originalFile);
                    df.delete();
                    dos.close();
 					
             } catch (Exception e) {
                    e.printStackTrace();
             }
       }
}