import java.util.TreeMap;
import java.util.Arrays;
import java.util.Map;
class Solution {
	    public String solution(String[] participant, String[] completion) {
	        String answer = "";
	        
	        Map<Integer, String> partMap = new TreeMap<>();
	        Map<Integer, String> complMap = new TreeMap<>();
	        
	        Arrays.sort(participant);
	        Arrays.sort(completion);
	        
	        for(int i =0; i<participant.length; i++) {
	        	partMap.put(i,participant[i]);
	        }
	        for(int j =0; j<participant.length-1; j++) {
	        	complMap.put(j,completion[j]);
	        }
	        while(true) {
	        for(int i=0; i<partMap.size(); i++) {
	        	if(!partMap.get(i).equals(complMap.get(i))) {
	        		answer = partMap.get(i);
	        		break;
	        	}
	        }
	        
	        return answer;
	    }
	}
}