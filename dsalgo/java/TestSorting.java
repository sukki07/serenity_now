import java.util.Arrays;

public class TestSorting {
	public static void main(String[] args)
	{
		CanSort obj = SortingMethod.getSortingMethod();
		int[] originalArray = {3,4,345,34,3464,56,34523,43,46,4567,547,4,563,5,34,64,56,34523,45,45,64,5674,5};
		System.out.println(Arrays.toString(originalArray));
		obj.sortByMethod(originalArray,"mergesort");
		System.out.println(Arrays.toString(originalArray));
	}
}

 
