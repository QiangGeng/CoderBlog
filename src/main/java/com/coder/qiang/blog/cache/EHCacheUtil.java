package com.coder.qiang.blog.cache;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.URL;
import java.util.List;

/**
 * ehcache工具类
 */

public class EHCacheUtil {

    static Logger logger = LoggerFactory.getLogger(EHCacheUtil.class);

    private static CacheManager cacheManager = null;

    public EHCacheUtil() {
    }

    private static CacheManager initCacheManager(String path) {
        try {
            if (cacheManager == null) {
                CacheManager.getInstance();
                URL url = EHCacheUtil.class.getClassLoader().getResource(path);
                cacheManager = CacheManager.create(url);
            }
        } catch (Exception var2) {
            var2.printStackTrace();
        }

        return cacheManager;
    }

    private static void initCache(String cacheName) {
        checkCacheManager();
        if (null == cacheManager.getCache(cacheName)) {
            cacheManager.addCache(cacheName);
        }
    }

    private static void checkCacheManager() {
        if (null == cacheManager) {
            throw new IllegalArgumentException("调用前请先初始化CacheManager值：EHCacheUtil.initCacheManager");
        }
    }

    private static void checkCache(Cache c) {
        if (null == c) {
            throw new IllegalArgumentException("调用前请先初始化Cache值：EHCacheUtil.initCache(参数)");
        }
    }

    private static void remove(Cache cache, String key) {
        checkCache(cache);
        cache.remove(key);
    }


    /**
     * 获取Cache所有的Keys
     *
     * @return
     * @cache
     */
    public static List getKeys(String cacheName) {
        return cacheManager.getCache(cacheName).getKeys();
    }


    public static void shutdown() {
        cacheManager.shutdown();
    }


    static {
        initCacheManager("ehcache.xml");
    }
}
