package com.mystudy.test.gradebook;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class Gradebook {

	public static void main(String[] args) {
		File inFile = new File("data.txt");
		File outFile = new File("result.txt");
		BufferedReader br = null;
		PrintWriter pw = null;

		List<StudentVO> list = new ArrayList<>();

		// 파일에서 읽어오기 (input)
		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(inFile)));
			pw = new PrintWriter(new FileOutputStream(outFile));

			StudentVO vo = null;

			String str = br.readLine();
			while (str != null) {
				String[] strSplit = str.split(",");
				vo = new StudentVO();
				vo.setId(strSplit[0]);
				vo.setName(strSplit[1]);
				vo.setKor(Integer.parseInt(strSplit[2]));
				vo.setEng(Integer.parseInt(strSplit[3]));
				vo.setMath(Integer.parseInt(strSplit[4]));
				list.add(vo);
				str = br.readLine();

			}
			printAll(list);

			// 파일로 출력 (output)
			for (int i = 0; i < list.size(); i++) {
				pw.println(list.get(i).getId() + "," + list.get(i).getName() + "," + list.get(i).getKor() + ","
						+ list.get(i).getEng() + "," + list.get(i).getMath() + "," + list.get(i).getTot() + ","
						+ list.get(i).getAvg());

				pw.flush();

			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			pw.close();
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private static void printAll(List<StudentVO> list) {
		System.out.println("학번\t성명\t국어\t영어\t수학\t총점\t평균");
		System.out.println("===================================");
		for (StudentVO vo : list) {
			System.out.println(vo.getId() + "\t" + vo.getName() + "\t" + vo.getKor() + "\t" + vo.getEng() + "\t"
					+ vo.getMath() + "\t" + vo.getTot() + "\t" + vo.getAvg());
		}
	}

}
