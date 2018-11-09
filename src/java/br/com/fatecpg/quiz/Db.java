package br.com.fatecpg.quiz;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;

public class Db {
   
    public static ArrayList<Question> getQuestions(){
        ArrayList<Question> questions = new ArrayList<>();
        questions.add(new Question ("Na construção de bancos de dados relacionais, o conceito de integridade referencial é usualmente implementado por meio de restrições conhecidas como:", "chaves estrangeiras", new String[]{"collation strings","triggers","stored procedures","chaves estrangeiras"}));
        questions.add(new Question ("No âmbito dos sistemas operacionais, o termo “swapping” refere-se a um mecanismo que:", "gerencia a sincronização em ambientes virtualizados", new String[]{"permite a utilização de dispositivos de entrada/saída externos","faz parte do gerenciamento de memória","gerencia o sistema de arquivos","gerencia a sincronização em ambientes virtualizados"}));
        questions.add(new Question ("Qual é a característica que define o modelo cascata?", "atividades sequenciais", new String[]{"atividades intercaladas","atividades sequenciais","rápida entrega do software","existência de componentes reusáveis"}));
        questions.add(new Question ("Utilizando CSS (Cascade Style Sheets), qual unidade de medida não se refere ao tamanho da fonte?", "length", new String[]{"ex","em","pica","length"}));
        questions.add(new Question ("A sequência que apresenta corretamente os três métodos centrais para o ciclo de vida de um servlet é:", "init / service / destroy", new String[]{"init / service / destroy","startup / do / dismiss","begin / execute / exit","start / response / shutdown"}));
        questions.add(new Question ("Um analista de sistema deseja utilizar um diagrama da UML de modo a representar uma perspectiva, orientada por tempo, da colaboração entre os objetos. Nesse caso, ele vai utilizar o diagrama de: ", "sequência", new String[]{"atividades","classe","objetos","sequência"}));
        questions.add(new Question ("O modelo TCP/IP refere-se a um conjunto de protocolos de comunicação, que estão organizados como uma pilha de camadas ou níveis, tal como o modelo ISO. Duas camadas pertinentes aos protocolos do modelo TCP/IP são:", "Aplicação e Transporte", new String[]{"Rede e Apresentação","Transporte e Sessão","Aplicação e Transporte","Apresentação e Aplicação"}));
        questions.add(new Question ("A tag do HTML, que serve para definir um parágrafo, é a:", "< P >", new String[]{"< P >","< N >","< I >","< S >"}));
        questions.add(new Question ("Acerca do desenvolvimento de aplicativos para dispositivos móveis, é correto afirmar que aplicativos:", "híbridos podem ser gerados através da compilação de código para diferentes sistemas", new String[]{"híbridos podem ser gerados através da compilação de código para diferentes sistemas","nativos são programados em plataformas de desenvolvimento genéricas, mas encapsulados em páginas web para uso em diferentes dispositivos","desenvolvidos para a web são ditos “não-responsivos”, pois são apresentados através dos navegadores instalados nos dispositivos","nativos são sempre mais lentos do que aplicativos para a web, pois não utilizam as otimizações disponíveis nos navegadores"}));
        questions.add(new Question ("___________ é a técnica de recuperação de banco de dados que posterga qualquer atualização real do banco de dados em disco até que uma transação atinja seu ponto de confirmação (commit). <br>Assinale a alternativa que preenche corretamente a lacuna do texto acima:", "Atualização adiada", new String[]{"Atualização adiada","Deadlock","Bloqueio de duas fases","Atualização imediata"}));
        
        Collections.shuffle(questions);
        
        return questions;
    }
    
    private static final ArrayList<Historic> historics = new ArrayList<>();
    
    public static ArrayList<Historic> getHistoric(){
        Calendar cal = Calendar.getInstance();
        
        if (historics.isEmpty()){          
            cal.set(2012, 2, 20, 20, 39);
            historics.add(new Historic ("Bruno", 5.5, cal.getTime()));
            
            cal.set(2016, 2, 10, 10, 23);
            historics.add(new Historic ("Leonardo", 9.0, cal.getTime())); 
            
            cal.set(2012, 2, 10, 5, 3);
            historics.add(new Historic ("Nicolas", 7.0, cal.getTime())); 
            
            cal.set(2018, 2, 15, 5, 19);
            historics.add(new Historic ("Anderson", 9.5, cal.getTime()));
            
            cal.set(2017, 9, 14, 15, 29);
            historics.add(new Historic ("Paolla", 6.5, cal.getTime()));
        }
        return historics;
    }
    
    private static final ArrayList<User> users = new ArrayList<>();
    
    public static ArrayList<User> getUser(){
        if (users.isEmpty()){
            users.add(new User ("Bruno"));
            users.add(new User ("Paolla"));
            users.add(new User ("Nicolas"));
            users.add(new User ("Anderson"));
            users.add(new User ("Leonardo"));
        }
        return users;
    }
}
