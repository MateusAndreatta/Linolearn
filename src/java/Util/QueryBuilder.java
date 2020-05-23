package Util;

import java.util.List;





// Abandonei o projeto de criar um querybuilder





public class QueryBuilder 
{
//    public static String insertBuilder(String tabela, String[] colunas, 
//            List<Object> valores)
//    {        
//        String query = String.format("INSERT INTO %s(%s) VALUES(%s)", 
//                tabela, 
//                iteratorColumn(colunas), 
//                iteratorValues(valores));
//        
//        return query;
//    }
//    
//    private static String iteratorValues(List<Object> colunasOuValores)
//    {   
//        String builded = "";
//        
//        for(int i = 0; i < colunasOuValores.size(); i++)
//        {
//            if(colunasOuValores[i] instanceof Integer 
//                || colunasOuValores[i] instanceof Float 
//                || colunasOuValores[i] == null )
//            {
//                builded += colunasOuValores[i];
//            } 
//            
//            if(colunasOuValores[i] instanceof String){
//                builded += "'" + colunasOuValores[i] + "'";
//            }
//            
//            if (i + 1 >= colunasOuValores.length) 
//            {
//                break;
//            }
//            
//            builded += ", ";
//        }   
//        return builded;
//    }
//    
//    private static String iteratorColumn(String[] colunasOuValores)
//    {   
//        String builded = "";
//        
//        for(int i = 0; i < colunasOuValores.length; i++)
//        {
//            if(colunasOuValores[i] instanceof Integer 
//                || colunasOuValores[i] instanceof Float 
//                || colunasOuValores[i] == null )
//            {
//                builded += colunasOuValores[i];
//            } 
//            
//            if(colunasOuValores[i] instanceof String){
//                builded += "'" + colunasOuValores[i] + "'";
//            }
//            
//            if (i + 1 >= colunasOuValores.length) 
//            {
//                break;
//            }
//            
//            builded += ", ";
//        }   
//        return builded;
//    }
}
