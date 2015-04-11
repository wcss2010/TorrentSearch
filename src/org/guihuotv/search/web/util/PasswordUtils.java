package org.guihuotv.search.web.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PasswordUtils {

	private static final Logger logger = LoggerFactory.getLogger(PasswordUtils.class);

	/**
	 * 对密码进行传输加密。
	 * 
	 * @param password
	 * @return
	 */
	public static String encodePassword(String password) {
		password = md5Encrypt(password);
		return md5Encrypt("*" + new StringBuilder(password).reverse().append(password).append("*").toString());
	}

	/**
	 * 密码两重加密，NGN用户，节点用。
	 * 
	 * @param password
	 * @return
	 */
	public static String encode2Password(String password) {
		return encodePassword(encodePassword(password));
	}

	/**
	 * 密码三重加密。MSC管理后台用。
	 * 
	 * @param password
	 * @return
	 */
	public static String encode3Password(String password) {
		return encodePassword(encodePassword(encodePassword(password)));
	}

	/**
	 * MD5加密
	 * 
	 * @throws NoSuchAlgorithmException
	 */
	public static final String md5Encrypt(String data) {
		byte[] enc = md5(data);
		return byte2hex(enc).toLowerCase();
	}

	/**
	 * MD5加密，返回byte[]
	 * 
	 * @throws NoSuchAlgorithmException
	 */
	public static final byte[] md5(String data) {
		byte[] enc = new byte[0];
		try {
			enc = md5(data.getBytes("UTF8"));
		} catch (UnsupportedEncodingException e) {
			logger.error(e.getMessage(), e);
		}
		return enc;
	}

	/**
	 * MD5加密，返回byte[]
	 * 
	 * @throws NoSuchAlgorithmException
	 */
	public static final byte[] md5(byte[] data) {
		byte[] enc = new byte[0];
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			digest.update(data);
			enc = digest.digest();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return enc;
	}

	/**
	 * 二行制转字符串
	 * 
	 * @param b
	 * @return
	 */
	public static String byte2hex(byte[] b) {
		StringBuilder sb = new StringBuilder(b.length * 3);
		String stmp = null;
		for (int n = 0; n < b.length; n++) {
			stmp = Integer.toHexString(b[n] & 0XFF);
			if (stmp.length() == 1)
				sb.append('0');
			sb.append(stmp);
		}
		return sb.toString().toUpperCase();
	}

	/**
	 * 倒置一维数组元素。此方法只对引用类型对象的数组有效
	 * 
	 * @param src
	 *            源数组
	 * @return 倒置之后的数组
	 */
	public static byte[] reverseByteArray(byte[] src) {
		int len = src.length;
		// 建立一个与源数组元素类型相同的数组
		// 为了防止修改源数组，将源数组拷贝一份副本
		byte[] dest = new byte[len];
		System.arraycopy(src, 0, dest, 0, len);
		byte temp;
		// 将顺位第i个与倒数第i个交换
		for (int i = 0; i < len / 2; ++i) {
			temp = dest[i];
			dest[i] = dest[len - i - 1];
			dest[len - i - 1] = temp;
		}
		return dest;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		byte[] data = PasswordUtils.md5(String.valueOf(System.nanoTime()));
		for (int i = 0; i < 10000000; i++) {
			// SecretKey sk = new SecretKeySpec(data, "AES");
			// System.out.println(sk.getEncoded().length);
		}
		System.out.println(System.currentTimeMillis() - start);

	}

}
