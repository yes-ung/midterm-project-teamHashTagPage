package teamproject;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;

@Component
public class ImageCache {
   private final Map<String, byte[]> thumbnailCache = new ConcurrentHashMap<>();   
   private final Map<String, byte[]> contentCache = new ConcurrentHashMap<>();
	
   public void putThumbnail(String bookId, byte[] image) {
	   thumbnailCache.put(bookId, image);
   }
   public void putContent(String bookId, byte[] image) {
	   contentCache.put(bookId, image);
   }
   
   public byte[] getThumbnail(String bookId) {
	   return thumbnailCache.get(bookId);
   }
   public byte[] getContent(String bookId) {
	   return contentCache.get(bookId);
   }
   
	
	
}

