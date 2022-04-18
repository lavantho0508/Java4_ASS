package BussinessLayer.ServiceDAL;

import java.util.List;

import BussinessLayer.ServiceInterface.IServiceBill;
import BussinessLayer.entities.Bill;

public class ServiceBill implements IServiceBill{
DataAccessLayer.ServiceBill sb;
public ServiceBill() {
	sb=new DataAccessLayer.ServiceBill();
	
}
	@Override
	public Bill add(Bill entity) throws Exception {
		return sb.add(entity);
	}

	@Override
	public Bill delete(Bill entity) throws Exception {
		return sb.delete(entity);
	}

	@Override
	public Bill update(Bill entity) throws Exception {
		return sb.update(entity);
	}

	@Override
	public Bill findById(Long id) throws Exception {
		return sb.findById(id);
	}

	@Override
	public List<Bill> selectAll() throws Exception {
		return sb.selectAll();
	}
	@Override
	public List<Bill> selectByUsername(String username) throws Exception {
		return sb.selectByUsername(username);
	}
	@Override
	public List<Bill> selectNotGroupBy(String username) throws Exception {
		return sb.selectNotGroupBy(username);
	}
	

}
