import java.util.Arrays;
public class SortingMethod implements CanSort{
	public static SortingMethod getSortingMethod()
	{
		return new SortingMethod();
	}

	public int[] sortByMethod(int[] originalArray,String methodName)
	{
		if(methodName.equals("selectionsort"))
		{
			selectionSort(originalArray);

		}
		else if (methodName.equals("mergesort"))
		{
			mergeSortWrapper(originalArray);

		}
		return originalArray;
	}

	public int[] mergeSortWrapper(int[] originalArray)
	{
		int low = 0;
		int high = originalArray.length - 1;
		mergeSort(originalArray,low,high);
		return originalArray;
	}

	public void mergeSort(int[] originalArray, int low,int high)
	{
		//System.out.println(String.format("low is %d high is %d",low,high));
		if (low == high)
		{
			//System.out.println("Bottomed out");
		}
		else
		{
			int middle = (low + high)/2;
			mergeSort(originalArray,low,middle);
			mergeSort(originalArray,middle+1,high);
			merge(originalArray,low,middle,middle+1,high);
		}
	}

	public void merge(int[] originalArray,int lower_part_begin,int lower_part_end,int higher_part_begin,int higher_part_end)
	{
		int[] merged_array = new int[higher_part_end - lower_part_begin + 1];
		int i = lower_part_begin;
		int j = higher_part_begin;
		int k = 0;
		while(i <= lower_part_end && j <= higher_part_end)
		{
			if (originalArray[i] < originalArray[j])
			{
				merged_array[k] = originalArray[i];
				i++;
				k++;
			}
			else
			{
				merged_array[k] = originalArray[j];
				j++;
				k++;
			}
		}

		while(i <= lower_part_end)
		{
			merged_array[k] = originalArray[i];
			i++;
			k++;

		}
		while(j <= higher_part_end)
		{
			merged_array[k] = originalArray[j];
			j++;
			k++;
		}
		int recopy_index = lower_part_begin;
		for(int newIndex =  0;newIndex < merged_array.length;newIndex++,recopy_index++)
		{
			originalArray[recopy_index] = merged_array[newIndex];
		}
		System.out.println(Arrays.toString(merged_array));
		System.out.println(Arrays.toString(originalArray));
	}


	public int[] selectionSort(int[] originalArray)
	{
		for (int index = 0;index < originalArray.length; index++)
		{
			int minElementIndex = findMinimumIndexInArrayFromIndex(index,originalArray);
			swap(originalArray,index,minElementIndex);
		}
		return originalArray;
	}

	private void swap(int[] originalArray,int index,int minElementIndex)
	{
		int temp = originalArray[index];
		originalArray[index] = originalArray[minElementIndex];
		originalArray[minElementIndex] = temp;
	}

	private int findMinimumIndexInArrayFromIndex(int index,int[] originalArray)
	{
		int min = originalArray[index];
		int min_index = index;
		for(int i = index;i<originalArray.length;i++)
		{
			if (originalArray[i] < min)
			{
				min = originalArray[i];
				min_index = i;
			}
		}
		return min_index;
	}

}
