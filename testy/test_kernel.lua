--test_scheduler.lua
package.path = package.path..";../?.lua"

local Kernel = require("schedlua.kernel")




local function numbers(ending)
	local idx = 0;
	local function fred()
		idx = idx + 1;
		if idx > ending then
			return nil;
		end
		return idx;
	end
	
	return fred;
end

local function task1()
	print("first task, first line")
	yield();
	print("first task, second line")
end

local function task2()
	print("second task, first line")
	yield()
	print("second task, second line")
end

local function task3()
	print("third task, first line")
	yield()
	print("third task, second line")
end

local function counter(name, nCount)
	for num in numbers(nCount) do
		print(name, num);
		yield();
	end
	
end

local function main()
	--local t0 = spawnPriority(counter, 8, "counter1", 5)
	local t1 = spawnPriority(task1, 6);
	--local t3 = spawnPriority(counter, 10, "counter2", 7);
	local t2 = spawnPriority(task2, 4);
	local t4 = spawnPriority(task3, 2);
	
end

run(main)


print("After kernel run...")
