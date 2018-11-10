import com.iyeeku.core.util.UUIDGenerator;

public class TestMain {

    public static void main(String[] args){

/*        String date = "Thu Sep 13 2018 00:00:00 GMT+0800 (中国标准时间)";
        //String date = "Thu Sep 13 2018";


        SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss' GMT'Z' (中国标准时间)'",Locale.ENGLISH);

        SimpleDateFormat dateFormat = new SimpleDateFormat("EEE MMM dd yyyy hh:mm:ss z" , Locale.US);
        //SimpleDateFormat dateFormat = new SimpleDateFormat("E MMM dd yyyy" , Locale.US);
        try {
            //System.out.println( dateFormat.parse(date) );
            System.out.println(sdf.parse(date));
        }catch (Exception e){
            e.printStackTrace();
        }*/


/*        String url = "/index";
        System.out.println(url.indexOf("/",1));*/

       for (int i=0 ; i < 11 ; i++)
        System.out.println(UUIDGenerator.generate(""));

    }

}
