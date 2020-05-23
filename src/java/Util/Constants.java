package Util;

/**
 *
 * @author Charlie
 */
public final class Constants 
{

    // Construtor privado para evitar instacia
    private Constants () {}
    
    // Constante de pagamento
    public final class PaymentStatus 
    {
        public static final int INICIADO = 1;
        public static final int PENDENTE = 2;
        public static final int FINALIZADO = 3;
        public static final int ERRO = 4;
    }
    
    // Roles do usuário
    public final class Role 
    {
        public static final int USER = 1;
        public static final int PROFESSOR = 2;
        public static final int ADMINISTRATOR = 3;
        public static final int GOD = 4;
    }
        
}
