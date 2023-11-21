# Solution 5

```Python
# Build up filename
VarName= “Ozone_”
TimeStamp = "2001-01-01"   # this could be in the nc file
Frame = str("%04d"%simhour)
MetaData = VarName+TimeStamp+"_"+Frame
fname_out = Home+MetaData+".png"

# create the file
savefig(fname_out,bbox_inches="tight",pad_inches=0.0)
```

**Questions**
- (i) Can you determine the content of the fname_out variable?
- (ii) What information is missing?

**Response**

The value of `fname_out` cannot be determined due to several issues with the code. These include:
1. The double quotation signs used for `VarName` is not correct. The correct version should be `VarName = "Ozone_"`.
2. The variables `simhour` and `Home` are missing. This causes the assignment to `Frame` fail, which subsequently causes the concatenation on the following line to also fail.

Assuming that `simhour` represents the current time, and `Home` representing the current directory, the content of `fname_out` could potentially take the following format: `./Ozone_2001-01-01_0623.png`, where `Home = "./"` and `simhour = 623`. 

**Updated Code:**
```Python
# Build up filename
simhour = 623       # <- assuming the time is 06:23am
Home = "./"         # <- assuming Home is pointed to the current directory
VarName= "Ozone_"   # <- qutations fixed
TimeStamp = "2001-01-01"   # this could be in the nc file
Frame = str("%04d"%simhour)
MetaData = VarName+TimeStamp+"_"+Frame
fname_out = Home+MetaData+".png"

print(fname_out)

# create the file
# savefig(fname_out,bbox_inches="tight",pad_inches=0.0)

```

**Output:**
```
./Ozone_2001-01-01_0623.png
```
