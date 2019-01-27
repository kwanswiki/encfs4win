#ifndef ENCFS4WIN_I18N_H
#define ENCFS4WIN_I18N_H

#include <tchar.h>
#include <stdexcept>

#define LENGTH(v) (sizeof(v)/sizeof(v[0]))

class wruntime_error
{
public:
	wruntime_error(const std::wstring& _err):err(_err) {}
	virtual ~wruntime_error() {}
	virtual const wchar_t *what() const { return err.c_str(); }
private:
	std::wstring err;
};

#ifdef UNICODE
# define tstring wstring
typedef wruntime_error truntime_error;
#else
# define tstring string
typedef std::runtime_error truntime_error;
#endif

#endif // ENCFS4WIN_I18N_H

