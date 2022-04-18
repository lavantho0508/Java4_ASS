package BussinessLayer.Utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtil {
	public static EntityManagerFactory getFactory() {
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("Assigment");
		return emf;
	}
	public static EntityManager createEntityManager() {
		EntityManager em=getFactory().createEntityManager();
		return em;//create entity de lam viec voi cac doi tuong
	}
public static void main(String[] args) {
	System.out.println(createEntityManager());
}
}
